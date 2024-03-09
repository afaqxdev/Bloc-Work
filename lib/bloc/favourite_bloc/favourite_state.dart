import 'package:block_work/model/favourite_model.dart';
import 'package:equatable/equatable.dart';
enum ListStatus{loading,error,success}
class FavouriteState extends Equatable{
    final List<FavouriteModel> favouriteList;
final ListStatus listStatus;
  const FavouriteState({
    this.favouriteList=const [],
    this.listStatus=ListStatus.loading,
  });
  FavouriteState copyWith({List<FavouriteModel>? favouriteList,ListStatus? listStatus}){
    return FavouriteState(
  favouriteList:favouriteList ??  this.favouriteList,
 listStatus : listStatus ??this.listStatus,
  );
  }
  
  @override
  List<Object> get props=>[favouriteList,listStatus];
}