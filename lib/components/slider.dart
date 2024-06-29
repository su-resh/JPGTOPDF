import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildSliderScreen(BuildContext context) {
  List<Map<String, dynamic>> imageList = [
    {"id": 1, "image_path": 'assets/images/1.svg'},
    {"id": 2, "image_path": 'assets/images/2.svg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  final CarouselOptions options = CarouselOptions(
    height: 200,
    enlargeCenterPage: true,
    autoPlay: true,
    onPageChanged: (index, _) {
      currentIndex = index;
    },
  );

  return Column(
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: options,
            items: imageList.map((item) {
              return SvgPicture.asset(
                item['image_path'],
                width: MediaQuery.of(context).size.width,
                height: 200,
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        currentIndex == entry.key ? Colors.blue : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ],
  );
}
