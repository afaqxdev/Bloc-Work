import 'package:block_work/bloc/image_bloc/image_event.dart';
import 'package:block_work/bloc/image_bloc/image_state.dart';
import 'package:block_work/utils/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerState>{

  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils):super(const ImagePickerState()){
    on<PickFromCammera>(cameraPicker);
    on<PickFromGallery>(gallaryPick);
  }


  cameraPicker(PickFromCammera event,Emitter<ImagePickerState> emit) async{
    final XFile? file=await imagePickerUtils.cameraCapture();
    emit(state.copyWith(imagepicker: file));

  }
  gallaryPick(PickFromGallery event,Emitter<ImagePickerState> emit) async{
    final XFile? file=await imagePickerUtils.galleryPick();
    emit(state.copyWith(imagepicker: file));

  }
}