
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
class ImagePickerState extends Equatable{
final XFile? imagepicker;
 const ImagePickerState({
   this.imagepicker
 });
 
  ImagePickerState copyWith({XFile? imagepicker}){
    return ImagePickerState(
      imagepicker: imagepicker??this.imagepicker
      );
  }
@override
List<Object?> get props=>[imagepicker];
}