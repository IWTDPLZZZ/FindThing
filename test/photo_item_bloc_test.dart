import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:find_thing/BLoC/photo_item_bloc.dart';
import 'package:find_thing/services/ai_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

class MockImagePicker extends Mock implements ImagePicker {}

class MockAiService extends Mock implements AiService {}

class FakeFile extends Fake implements File {}

void main() {
  late MockImagePicker mockPicker;
  late MockAiService mockAi;

  setUpAll(() {
    registerFallbackValue(FakeFile());
  });

  setUp(() {
    mockPicker = MockImagePicker();
    mockAi = MockAiService();
  });

  PhotoItemBloc buildBloc() =>
      PhotoItemBloc(picker: mockPicker, ai: mockAi);

  group('PhotoItemBloc', () {
    test('initial state is PhotoItemIdle', () {
      expect(buildBloc().state, const PhotoItemIdle());
    });

    blocTest<PhotoItemBloc, PhotoItemState>(
      'emits [Cancelled, Idle] when user cancels image picker',
      build: () {
        when(() => mockPicker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 85,
            )).thenAnswer((_) async => null);
        return buildBloc();
      },
      act: (bloc) =>
          bloc.add(const PhotoItemPickImage(ImageSource.gallery)),
      expect: () => [
        const PhotoItemCancelled(),
        const PhotoItemIdle(),
      ],
    );

    blocTest<PhotoItemBloc, PhotoItemState>(
      'emits [Loading, Detected] on successful detection',
      build: () {
        when(() => mockPicker.pickImage(
              source: ImageSource.camera,
              imageQuality: 85,
            )).thenAnswer((_) async => XFile('/tmp/photo.jpg'));
        when(() => mockAi.detectThing(any()))
            .thenAnswer((_) async => 'laptop');
        return buildBloc();
      },
      act: (bloc) =>
          bloc.add(const PhotoItemPickImage(ImageSource.camera)),
      expect: () => [
        const PhotoItemLoading(),
        const PhotoItemDetected(name: 'laptop', imagePath: '/tmp/photo.jpg'),
      ],
    );

    blocTest<PhotoItemBloc, PhotoItemState>(
      'emits [Loading, Failure, Idle] when AI returns null',
      build: () {
        when(() => mockPicker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 85,
            )).thenAnswer((_) async => XFile('/tmp/photo.png'));
        when(() => mockAi.detectThing(any()))
            .thenAnswer((_) async => null);
        return buildBloc();
      },
      act: (bloc) =>
          bloc.add(const PhotoItemPickImage(ImageSource.gallery)),
      expect: () => [
        const PhotoItemLoading(),
        const PhotoItemFailure(
            'Не удалось распознать предмет. Попробуйте другое фото.'),
        const PhotoItemIdle(),
      ],
    );

    blocTest<PhotoItemBloc, PhotoItemState>(
      'emits [Loading, Failure, Idle] on network error',
      build: () {
        when(() => mockPicker.pickImage(
              source: ImageSource.camera,
              imageQuality: 85,
            )).thenAnswer((_) async => XFile('/tmp/photo.jpg'));
        when(() => mockAi.detectThing(any()))
            .thenThrow(Exception('No internet'));
        return buildBloc();
      },
      act: (bloc) =>
          bloc.add(const PhotoItemPickImage(ImageSource.camera)),
      expect: () => [
        const PhotoItemLoading(),
        const PhotoItemFailure('Ошибка распознавания: Exception: No internet'),
        const PhotoItemIdle(),
      ],
    );

    blocTest<PhotoItemBloc, PhotoItemState>(
      'emits [Added, Idle] on confirm',
      build: buildBloc,
      act: (bloc) => bloc.add(const PhotoItemConfirmItem(
        name: 'Чашка',
        place: 'Коробка 1',
        imagePath: '/tmp/cup.jpg',
      )),
      expect: () => [
        const PhotoItemAdded(),
        const PhotoItemIdle(),
      ],
    );

    blocTest<PhotoItemBloc, PhotoItemState>(
      'emits [Idle] on reset',
      build: buildBloc,
      act: (bloc) => bloc.add(const PhotoItemReset()),
      expect: () => [const PhotoItemIdle()],
    );
  });
}
