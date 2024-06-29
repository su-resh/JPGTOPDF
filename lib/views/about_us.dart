import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        title: Text(
          "Image to PDF Converter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Our Image to PDF Converter App',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome to our Image to PDF Converter app, developed by Thulo Technology! We are excited to provide you with a seamless solution for converting images to PDF format.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'At Thulo Technology, our mission is to simplify complex tasks. With our Image to PDF Converter app, we aim to streamline the process of converting images into universally compatible PDF documents. Whether you’re a student, professional, or anyone dealing with image files, our app is designed to meet your conversion needs efficiently.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Contact Developer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'For any inquiries or feedback regarding our Image to PDF Converter app, feel free to contact the developer:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Developer: Suresh Subedi',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Email: workwithsureshsubedi@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
