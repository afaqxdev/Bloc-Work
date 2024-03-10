import 'package:block_work/utils/post_status.dart';
import 'package:equatable/equatable.dart';

import '../../model/api_model.dart';

class PostState extends Equatable{
  final PostStatus postStatus;
  final List<ApiModel> list;
  final String message;
  const PostState({
     this.list=const <ApiModel>[],
     this.message='',
     this.postStatus=PostStatus.loading,
  });

  PostState copyWith({PostStatus? postStatus,List<ApiModel>? list,String? message}){
    return PostState(
      list: list??this.list,
      message: message??this.message,
      postStatus: postStatus??this.postStatus,
    );
  }
  @override
  List<Object?> get props => [postStatus,postStatus];

}