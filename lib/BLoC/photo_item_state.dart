part of 'photo_item_bloc.dart';

abstract class PhotoItemState extends Equatable {
  const PhotoItemState();
  @override
  List<Object?> get props => [];
}

class PhotoItemIdle extends PhotoItemState {
  const PhotoItemIdle();
}

class PhotoItemLoading extends PhotoItemState {
  const PhotoItemLoading();
}

/// Gemini detected the item — waiting for user to confirm the storage place.
class PhotoItemDetected extends PhotoItemState {
  final String name;
  final String imagePath;
  const PhotoItemDetected({required this.name, required this.imagePath});

  @override
  List<Object?> get props => [name, imagePath];
}

/// Item was confirmed and added to the inventory.
class PhotoItemAdded extends PhotoItemState {
  const PhotoItemAdded();
}

class PhotoItemFailure extends PhotoItemState {
  final String message;
  const PhotoItemFailure(this.message);

  @override
  List<Object?> get props => [message];
}

/// User cancelled image picker — silent return to idle.
class PhotoItemCancelled extends PhotoItemState {
  const PhotoItemCancelled();
}
