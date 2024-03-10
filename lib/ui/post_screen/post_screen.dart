import 'package:block_work/bloc/post_bloc/post_bloc.dart';
import 'package:block_work/bloc/post_bloc/post_event.dart';
import 'package:block_work/bloc/post_bloc/post_state.dart';
import 'package:block_work/utils/post_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
@override
  void initState() {
context.read<PostBloc>().add(PostFetched());    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api"),
      centerTitle: true,

      ),
body: BlocBuilder<PostBloc,PostState>(builder:(context, state) {
   switch (state.postStatus) {
            case PostStatus.loading:
              return const CircularProgressIndicator();
            case PostStatus.error:
              return  Text(state.message.toString());
            case PostStatus.success:
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final item = state.list[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.email.toString()),
                      
                    ),
                  );
                },
                
                );
                
                }
                
  }),
            
    );
  }
}