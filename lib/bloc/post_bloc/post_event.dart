import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable{
  @override
  List<Object> get props=>[];

}
class PostFetched extends PostEvent{
  
}
class SearchList extends PostEvent{
  final String search;
   SearchList(this.search);
}