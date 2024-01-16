import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../contollers/home_bloc.dart';

class HomeCarousalSlider extends StatelessWidget {
  const HomeCarousalSlider  ({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: HomeBloc.getBanners?.data
          .map((item) => ClipRRect(
        borderRadius: const BorderRadius.all(
            Radius.circular(0)),
        child: Image(
          image: NetworkImage(
            item.image,
          ),
          fit: BoxFit.cover,

          filterQuality: FilterQuality.medium,
        ),
      ))
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        scrollPhysics: const BouncingScrollPhysics(),
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        autoPlay: true,
        enableInfiniteScroll: true,
        animateToClosest: true,
        aspectRatio: 1.6,
      ),
    );
  }
}
