part of 'photo_item_bloc.dart';

abstract class PhotoItemEvent extends Equatable {
  const PhotoItemEvent();

  @override
  List<Object?> get props => [];
}

/// User picked a photo source (camera or gallery) — start the full flow.
class PhotoItemPickImage extends PhotoItemEvent {
  final ImageSource source;
  const PhotoItemPickImage(this.source);

  @override
  List<Object?> get props => [source];
}

/// User confirmed the detected item with a storage place.
class PhotoItemConfirmItem extends PhotoItemEvent {
  final String name;
  final String place;
  final String imagePath;
  const PhotoItemConfirmItem({
    required this.name,
    required this.place,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [name, place, imagePath];
}

/// Reset bloc to idle (e.g. after dialog dismissed).
class PhotoItemReset extends PhotoItemEvent {
  const PhotoItemReset();
}
