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
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Image Example",
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                if (state.imagepicker == null) {
                  return const SizedBox.shrink();
                } else {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.file(File(state.imagepicker!.path)),
                  );
                }
              },
            ),
            ElevatedButton(
              child: const Text(
                'Select Picture',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Container(
                        height: 200,
                        color: Colors.amber.shade300,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<ImagePickerBloc>()
                                            .add(PickFromCammera());
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.camera,
                                        size: 50,
                                      ));
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<ImagePickerBloc>()
                                            .add(PickFromGallery());
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.browse_gallery_sharp,
                                        size: 50,
                                      ));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
