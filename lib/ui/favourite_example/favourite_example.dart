import 'package:block_work/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:block_work/bloc/favourite_bloc/favourite_event.dart';
import 'package:block_work/bloc/favourite_bloc/favourite_state.dart';
import 'package:block_work/model/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteExample extends StatefulWidget {
  const FavouriteExample({super.key});

  @override
  State<FavouriteExample> createState() => _FavouriteExampleState();
}

class _FavouriteExampleState extends State<FavouriteExample> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO DO List"),
        centerTitle: true,
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const CircularProgressIndicator();
            case ListStatus.error:
              return const Text("SomeThing Went Wrrong");
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favouriteList.length,
                itemBuilder: (context, index) {
                  final item = state.favouriteList[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.value.toString()),
                      trailing: IconButton(icon:  Icon(
                         item.isFavourite?Icons.favorite:Icons.favorite_border_outlined),
                         onPressed: () {
                        FavouriteModel favouriteModel=FavouriteModel(id: item.id,value: item.value,isFavourite: item.isFavourite?false:true);
                        context.read<FavouriteBloc>().add(FavouriteItem(item:favouriteModel ));
                      },),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
