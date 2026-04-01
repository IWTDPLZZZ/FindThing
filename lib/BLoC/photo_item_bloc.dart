import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:find_thing/services/ai_service.dart';

part 'photo_item_event.dart';
part 'photo_item_state.dart';

class PhotoItemBloc extends Bloc<PhotoItemEvent, PhotoItemState> {
  final ImagePicker picker;
  final AiService ai;

  PhotoItemBloc({required this.picker, required this.ai})
    : super(const PhotoItemIdle()) {
    on<PhotoItemPickImage>(_onPickImage);
    on<PhotoItemConfirmItem>(_onConfirmItem);
    on<PhotoItemReset>(_onReset);
  }

  Future<void> _onPickImage(
    PhotoItemPickImage event,
    Emitter<PhotoItemState> emit,
  ) async {
    final XFile? image = await picker.pickImage(
      source: event.source,
      imageQuality: 85,
    );
    if (image == null) {
      emit(const PhotoItemCancelled());
      emit(const PhotoItemIdle());
      return;
    }

    emit(const PhotoItemLoading());

    try {
      final name = await ai.detectThing(File(image.path));
      if (name == null) {
        emit(const PhotoItemFailure(
          'Не удалось распознать предмет. Попробуйте другое фото.',
        ));
        emit(const PhotoItemIdle());
        return;
      }
      emit(PhotoItemDetected(name: name, imagePath: image.path));
    } catch (e) {
      emit(PhotoItemFailure(
        'Ошибка распознавания: '
        '${e.toString().length > 120 ? '${e.toString().substring(0, 120)}…' : e}',
      ));
      emit(const PhotoItemIdle());
    }
  }

  void _onConfirmItem(
    PhotoItemConfirmItem event,
    Emitter<PhotoItemState> emit,
  ) {
    emit(const PhotoItemAdded());
    emit(const PhotoItemIdle());
  }

  void _onReset(PhotoItemReset event, Emitter<PhotoItemState> emit) {
    emit(const PhotoItemIdle());
  }
}
