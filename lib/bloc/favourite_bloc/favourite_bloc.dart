import 'package:bloc/bloc.dart';
import 'package:block_work/bloc/favourite_bloc/favourite_event.dart';
import 'package:block_work/bloc/favourite_bloc/favourite_state.dart';
import 'package:block_work/model/favourite_model.dart';
import 'package:block_work/repo/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvent,FavouriteState>{
  List<FavouriteModel> favouriteList=[];
  FavouriteRepository favouriteRepository;
  FavouriteBloc(this.favouriteRepository):super(const FavouriteState()){
    on<FetchFavouriteList>(_fetchList);
    on<FavouriteItem>(_favoutiteItem);
  }
  _fetchList(FetchFavouriteList event,Emitter<FavouriteState>emit)async{
    favouriteList= await favouriteRepository.fetctItem();
emit(state.copyWith(favouriteList:List.from(favouriteList) ,listStatus:ListStatus.success ));

  }
  _favoutiteItem(FavouriteItem event,Emitter<FavouriteState>emit)async{
final index=favouriteList.indexWhere((element) => element.id==event.item.id);
favouriteList[index]=event.item;
emit(state.copyWith(favouriteList:List.from(favouriteList) ));

  }
}