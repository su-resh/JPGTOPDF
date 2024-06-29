import 'package:flutter/material.dart';
import 'package:jpgtopdf/components/slider.dart';
import 'package:jpgtopdf/components/upload_comp.dart';
import '../models/navbar_threedot.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key});
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Jpg to Pdf",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: popupmenubutton(context),
          ),
        ],
        
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildSliderScreen(context),
          uploadMethods(context),
        ],
      ),
    );
  }
}
