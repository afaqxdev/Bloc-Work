import 'package:block_work/bloc/post_bloc/post_bloc.dart';
import 'package:block_work/bloc/post_bloc/post_event.dart';
import 'package:block_work/bloc/post_bloc/post_state.dart';
import 'package:block_work/utils/post_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    context.read<PostBloc>().add(PostFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const CircularProgressIndicator();
          case PostStatus.error:
            return Text(state.message.toString());
          case PostStatus.success:
            return Column(
              children: [
                TextField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  onChanged: (key) {
                    context.read<PostBloc>().add(SearchList(key));
                  },
                ),
                Expanded(
                  child:state.searchMessage.isEmpty? ListView.builder(
                    itemCount: state.searchList.isEmpty
                        ? state.list.length
                        : state.searchList.length,
                    itemBuilder: (context, index) {
                      if (state.searchList.isEmpty) {
                        final item = state.list[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                                "${item.id.toString()}${item.email.toString()}"),
                            subtitle: Text(item.body.toString()),
                          ),
                        );
                      } else {
                        final search = state.searchList[index];

                        return Card(
                          child: ListTile(
                            title: Text(
                                "${search.id.toString()}${search.email.toString()}"),
                            subtitle: Text(search.body.toString()),
                          ),
                        );
                      }
                    },
                  ):Text(state.searchMessage)
                ),
              ],
            );
        }
      }),
    );
  }
}
