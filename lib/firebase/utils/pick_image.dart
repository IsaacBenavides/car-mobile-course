import 'dart:async';
import 'package:image_picker/image_picker.dart';

class PickImageCustom {
  static Future<XFile?> pickImageFromGallery() async {
    ImagePicker? imagePicker = ImagePicker();

    XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 650,
      maxWidth: 750,
    );
    imagePicker = null;
    return image;
  }

  static Future<XFile?> pickImageFromCamera() async {
    ImagePicker? imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxHeight: 650,
      maxWidth: 750,
    );
    imagePicker = null;
    print('termine de tomar la foto');
    return image;
  }
}
