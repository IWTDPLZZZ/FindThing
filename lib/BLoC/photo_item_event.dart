part of 'photo_item_bloc.dart';

abstract class PhotoItemEvent extends Equatable {
  const PhotoItemEvent();

  @override
  List<Object> get props => [];
}

class PhotoItemEventTakePhoto extends PhotoItemEvent {
  final String pathImage;
  PhotoItemEventTakePhoto({required this.pathImage});

  @override
  List<Object> get props => [pathImage];
}

class PhotoItemEventSelectPhoto extends PhotoItemEvent {
  final String name;
  final String place;
  PhotoItemEventSelectPhoto({required this.name, required this.place});

  @override
  List<Object> get props => [name, place];
}
