import 'package:equatable/equatable.dart';

class FavouriteModel extends Equatable {
  const FavouriteModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false,
  });

  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  FavouriteModel copyWith(
      {String? id, String? value, bool? isDeleting, bool? isFavourite}) {
    return FavouriteModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isDeleting: isDeleting ?? this.isDeleting,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  List<Object?> get props => [id,value,isDeleting,isFavourite] ;
}
