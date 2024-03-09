import 'package:block_work/model/favourite_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable{

  const FavouriteEvent();
  @override
  List<Object> get props=>[];
}
class FetchFavouriteList extends FavouriteEvent{
  
}
class FavouriteItem extends FavouriteEvent{
final FavouriteModel item;
const FavouriteItem({
  required this.item,
});
}