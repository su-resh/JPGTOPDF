import 'package:flutter/material.dart'; // Importing flutter's material package
import 'package:image_picker/image_picker.dart'; // Importing image_picker package
import 'package:jpgtopdf/models/images_list.dart'; // Importing custom images_list model
import 'package:jpgtopdf/views/selected_images.dart';
import 'package:permission_handler/permission_handler.dart'; // Importing selected_images view

// Creating an instance of ImagesList class
ImagesList imagesList = ImagesList();

Future<PermissionStatus> storagePermissionStatus() async {
  PermissionStatus storagePermissionStatus = await Permission.storage.status;

  if (!storagePermissionStatus.isGranted) {
    await Permission.storage.request();
  }
  storagePermissionStatus = await Permission.storage.status;
  return storagePermissionStatus;
}

Future<PermissionStatus> cameraPermissionStatus() async {
  PermissionStatus cameraPermissionStatus = await Permission.camera.status;

  if (!cameraPermissionStatus.isGranted) {
    await Permission.camera.request();
  }

  cameraPermissionStatus = await Permission.camera.status;

  return cameraPermissionStatus;
}

// Function to pick images from the gallery
void pickGalleryImages(BuildContext context) async {
  PermissionStatus status = await storagePermissionStatus();

  if (status.isGranted) {
    final ImagePicker picker =
        ImagePicker(); // Creating an instance of ImagePicker
    final List<XFile> images = await picker
        .pickMultiImage(); // Picking multiple images from the gallery

    if (images.isNotEmpty) {
      // If images are selected
      imagesList.clearImagesList(); // Clearing the previous list of images
      imagesList.imagePaths
          .addAll(images); // Adding the selected images to the list

      // Navigating to the SelectedImages view
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SelectedImages()),
      );
    }
  }
}

// Function to capture images from the camera
void captureCameraImages(BuildContext context) async {
  PermissionStatus status = await cameraPermissionStatus();
  if (status.isGranted) {
    final ImagePicker picker =
        ImagePicker(); // Creating an instance of ImagePicker
    final XFile? image = await picker.pickImage(
        source: ImageSource.camera); // Capturing image from the camera

    if (image != null) {
      // If image is captured
      imagesList.clearImagesList(); // Clearing the previous list of images
      imagesList.imagePaths.add(image); // Adding the captured image to the list

      // Navigating to the SelectedImages view
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SelectedImages()),
      );
    }
  }
}

// Widget to display upload methods
Column uploadMethods(BuildContext context) {
  return Column(
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => pickGalleryImages(
                  context), // Calling pickGalleryImages function on tap
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.upload,
                      size: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Select",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => captureCameraImages(
                  context), // Calling captureCameraImages function on tap
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.camera_alt_rounded,
                      size: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Click Image",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
