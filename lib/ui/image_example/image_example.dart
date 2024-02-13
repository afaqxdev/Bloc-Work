import 'dart:io';

import 'package:block_work/bloc/image_bloc/image_bloc.dart';
import 'package:block_work/bloc/image_bloc/image_event.dart';
import 'package:block_work/bloc/image_bloc/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerExample extends StatelessWidget {
  const ImagePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(title: const Text("Image Example",)),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
           showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),         BlocBuilder<ImagePickerBloc,ImagePickerState>(builder: (context, state) {
              if(state.imagepicker==null){
                return IconButton(onPressed: () {
                  context.read<ImagePickerBloc>().add(PickFromGallery());
                }, icon: const Icon(Icons.camera,size: 50,));
              }else{
                return Image.file( File(state.imagepicker!.path));
              }
            },)
          ],
        ),
      ),
    );
  }
}
