import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carrousel extends StatelessWidget {
  final List<String> imageList;

  const Carrousel({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = 400;

    return CarouselSlider(
      options: CarouselOptions(
        height: imageHeight,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        viewportFraction: 0.8,
      ),
      items: imageList.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/multimedia');
              },
              child: Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image:
                        AssetImage(imageUrl), //TODO cache image to load faster
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
