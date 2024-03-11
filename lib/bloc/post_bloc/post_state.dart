import 'package:block_work/utils/post_status.dart';
import 'package:equatable/equatable.dart';

import '../../model/api_model.dart';

class PostState extends Equatable{
  final PostStatus postStatus;
  final List<ApiModel> searchList;
  final List<ApiModel> list;
  final String message;
  final String searchMessage;
  const PostState({
     this.list=const <ApiModel>[],
     this.searchList=const <ApiModel>[],
     this.message='',
     this.searchMessage='',
     this.postStatus=PostStatus.loading,
  });

  PostState copyWith({PostStatus? postStatus,List<ApiModel>? list,List<ApiModel>? searchList,String? message,String? searchMessage}){
    return PostState(
      list: list??this.list,
      searchList: searchList??this.searchList,
      message: message??this.message,
      searchMessage: searchMessage??this.searchMessage,
      postStatus: postStatus??this.postStatus,
    );
  }
  @override
  List<Object?> get props => [list,message,searchList,postStatus,searchMessage];

}