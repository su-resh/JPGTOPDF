import 'package:flutter/material.dart';
import 'package:jpgtopdf/views/about_us.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            popupmenubutton(context),
          ],
        ),
        body: const Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}

PopupMenuButton<String> popupmenubutton(BuildContext context) {
  return PopupMenuButton(
    icon: const Icon(
      Icons.more_vert,
      color: Colors.white,
    ),
    onSelected: (String value) {
      switch (value) {
        case 'about_app':
          // Navigate to the About Us page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUsPage()),
          );
          break;
        case 'rate_us':
          // Open the website for rating the app
          launch('https://www.sureshsubedi.info.np');
          break;
        case 'contact_us':
          // Redirect to email for contacting
          launch('mailto:workwithsureshsubedi@gmail.com');
          break;
        case 'share_app':
          // Share the app
          Share.share(
              'Check out this amazing app: https://www.sureshsubedi.info.np');
          break;
        case 'privacy_policy':
          // Open the website for privacy policy
          launch('https://www.sureshsubedi.info.np/privacy-policy');
          break;
      }
    },
    itemBuilder: (BuildContext context) {
      return [
        const PopupMenuItem(
          value: 'about_app',
          child: Row(
            children: [
              Icon(Icons.info, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                'About App',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'rate_us',
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                'Rate Us',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'contact_us',
          child: Row(
            children: [
              Icon(Icons.email, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                'Contact Us',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'share_app',
          child: Row(
            children: [
              Icon(Icons.share, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                'Share App',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'privacy_policy',
          child: Row(
            children: [
              Icon(Icons.lock, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                'Privacy Policy',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ];
    },
  );
}
