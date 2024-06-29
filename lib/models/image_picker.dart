import 'package:image_picker/image_picker.dart';
import 'package:jpgtopdf/models/images_list.dart';

ImagesList imagesList = ImagesList();

void pickGalleryImage() async {
  final ImagePicker picker = ImagePicker();
  final List<XFile> images = await picker.pickMultiImage();

  if (images.isNotEmpty) {
    imagesList.clearImagesList();
    imagesList.imagePaths.addAll(images);
  }
}
