import 'package:block_work/bloc/post_bloc/post_event.dart';
import 'package:block_work/bloc/post_bloc/post_state.dart';
import 'package:block_work/model/api_model.dart';
import 'package:block_work/repo/post_repoository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/post_status.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<ApiModel> searchList = [];
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostState()) {
    on<PostFetched>(_postFetched);
    on<SearchList>(_searchItem);
  }
  void _postFetched(PostFetched event, Emitter<PostState> emit) async {
    await postRepository.getPost().then((value) {
      emit(state.copyWith(postStatus: PostStatus.success, list: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          message: error.toString(), postStatus: PostStatus.error));
    });
  }

  void _searchItem(SearchList event, Emitter<PostState> emit) async {
    if (event.search.isEmpty) {
      emit(state.copyWith(searchList: [],searchMessage: ""));
    } else {
      searchList = state.list
          .where((element) => element.email.toString().toLowerCase().contains(event.search.toString()))
          .toList();
      if (searchList.isEmpty) {
       emit(state.copyWith(searchList: searchList,searchMessage: "Data Not Found"));
      } else {

          emit(state.copyWith(searchList: searchList,searchMessage: ""));
      }
    }
  }
}
