// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final PickedFile? file =
      await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 40);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["png", "PNG", "jpg", "JPG", "png", "PNG", "svg", "SVG", "jpeg", "JPEG", "gif", "GIF"]
          : ["png", "PNG", "jpg", "JPG", "png", "PNG", "svg", "SVG", "jpeg", "JPEG", "gif", "GIF"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
