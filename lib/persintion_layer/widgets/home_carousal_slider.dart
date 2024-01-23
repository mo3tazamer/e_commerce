import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/data_layer/models/bnnersmodel/bannersmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/entites/banners/banners.dart';
import '../contollers/home_bloc.dart';

class HomeCarousalSlider extends StatelessWidget {
   HomeCarousalSlider  ({super.key, required this.items});
   List<BannersData> items ;

  @override
  Widget build(BuildContext context) {
    var  homeBloc = BlocProvider.of<HomeBloc>(context);

    return CarouselSlider(
      items: items
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
