import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:find_thing/models/storage_item_main_page.dart';
import 'package:find_thing/services/ai_service.dart';

part 'photo_item_event.dart';
part 'photo_item_state.dart';

class PhotoItemBloc extends Bloc<PhotoItemEvent, PhotoItemState> {
  final ImagePicker picker;
  final GeminiService gemini;
  String? _pathImage;
  PhotoItemBloc({required this.picker, required this.gemini})
    : super(const PhotoItemInitialState()) {
    on<PhotoItemEventTakePhoto>(_onPhotoItemTakePhoto);
    on<PhotoItemEventSelectPhoto>(_onPhotoItemSelectPhoto);
  }

  Future<void> _onPhotoItemTakePhoto(
    PhotoItemEventTakePhoto event,
    Emitter<PhotoItemState> emit,
  ) async {
    try {
      emit(PhotoItemLoadingState(items: state.items));
    } catch (_) {
      rethrow;
    }
  }

  Future<void> _onPhotoItemSelectPhoto(
    PhotoItemEventSelectPhoto event,
    Emitter<PhotoItemState> emit,
  ) async {
    try {
      emit(PhotoItemLoadingState(items: state.items));

      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
      if (image == null) {
        throw PhotoItemFeilure(message: 'Не удалось выбрать фото');
      }
      _pathImage = image.path;
      emit(PhotoItemSuccessState(items: state.items));
    } catch (_) {
      throw PhotoItemFeilure(message: 'Не удалось выбрать фото');
    }
  }
}
