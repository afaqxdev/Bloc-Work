import 'package:block_work/model/favourite_model.dart';

class FavouriteRepository{
  Future<List<FavouriteModel>> fetctItem()async{
    await Future.delayed(const Duration(seconds: 2));
    return List.of(_generateList(10));
  }

  List<FavouriteModel> _generateList(int lenght){
    return List.generate(lenght, (index) {
      return FavouriteModel(id: index.toString(), value:"item:$index");
    });

  }
}