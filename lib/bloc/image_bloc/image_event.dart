import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable{
  const ImagePickerEvent();
  @override
  List<Object> get props=>[];
}
class PickFromGallery extends ImagePickerEvent{}
class PickFromCammera extends ImagePickerEvent{}