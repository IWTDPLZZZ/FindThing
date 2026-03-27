part of 'photo_item_bloc.dart';

abstract class PhotoItemState extends Equatable {
  final List<StorageItemMainPage> items;
  const PhotoItemState({this.items = const []});
  @override
  List<Object?> get props => [items];
}

class PhotoItemInitialState extends PhotoItemState {
  const PhotoItemInitialState({super.items = const []});
}

class PhotoItemLoadingState extends PhotoItemState {
  const PhotoItemLoadingState({required super.items});
}

class PhotoItemSuccessState extends PhotoItemState {
  const PhotoItemSuccessState({required super.items});
}

class ItemDetected extends PhotoItemState {
  final String name;
  final String place;
  final String pathImage;
  ItemDetected({
    required this.name,
    required this.place,
    required this.pathImage,
  });
  @override
  List<Object?> get props => [name, place, pathImage];
}

class PhotoItemFeilure extends PhotoItemState {
  final String message;
  const PhotoItemFeilure({required this.message, super.items = const []});
  @override
  List<Object?> get props => [message, items];
}
