import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jpgtopdf/models/images_list.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:image/image.dart' as img;

import '../models/navbar_threedot.dart';

class SelectedImages extends StatefulWidget {
  const SelectedImages({super.key});

  @override
  State<SelectedImages> createState() => _SelectedImagesState();
}

class _SelectedImagesState extends State<SelectedImages> {
  ImagesList imagesList = ImagesList();
  late double progressValue = 0;
  late bool isExporting = false;
  late int convertedImage = 0;

  void convertImage() async {
    setState(() {
      isExporting = true;
    });

    // Get the current timestamp
    final now = DateTime.now();
    final timestamp = now.millisecondsSinceEpoch;

    final pathToSave = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOCUMENTS);

    final pdf = pw.Document();

    for (final imagePath in imagesList.imagePaths) {
      final imageBytes = await File(imagePath.path).readAsBytes();
      final image = img.decodeImage(imageBytes);

      if (image != null) {
        final pdfImage = pw.MemoryImage(imageBytes);
        pdf.addPage(pw.Page(build: (pw.Context context) {
          return pw.Center(child: pw.Image(pdfImage));
        }));
      }
      setState(() {
        convertedImage++;
        progressValue = convertedImage / imagesList.imagePaths.length;
      });
    }

    // Construct the filename with a timestamp
    final filename = 'NewPdf_$timestamp.pdf';
    final outputFile = File('$pathToSave/$filename');
    await outputFile.writeAsBytes(await pdf.save());
    MediaScanner.loadMedia(path: outputFile.path);

    // Reset the exporting state and show the Snackbar
    setState(() {
      isExporting = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pdf made and saved on files.')),
    );

    // Navigate back to the home screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Jpg to Pdf Converter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: popupmenubutton(context),
          ),
        ],
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.blue[400],
        textColor: Colors.white,
        onPressed: convertImage,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: const Text(
          "Convert",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: isExporting,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: LinearProgressIndicator(
                  minHeight: 25,
                  borderRadius: BorderRadius.circular(20),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  value: progressValue,
                ),
              ),
            ),
            const Gap(10),
            Visibility(
              visible: !isExporting,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: imagesList.imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Image(
                      image: FileImage(
                        File(imagesList.imagePaths[index].path),
                      ),
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
