
import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/theme/font_manager.dart';
import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/route.dart';
import '../../core/theme/textstyle_manager.dart';

import '../widgets/home_appbar.dart';
import '../widgets/home_carousal_slider.dart';
import '../widgets/home_categories_list.dart';
import '../widgets/home_products_list.dart';

import '../widgets/my_snakebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is IsFavSuccess) {
          mySnakeBar(message: state.favModel.message, context: context);

          if (state is IsFavError) {
             mySnakeBar(message: state.favModel.message, context: context);
          }
        }
      },
      builder: (context, state) {
        var homeBloc = BlocProvider.of<HomeBloc>(context);


        return Scaffold(
            appBar: HomeAppBar( showBadge: true,
              favCount: HomeBloc.getFavorites?.length,
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.favorites);
              },

            ),
            body: homeBloc.getBanners != null &&
                    homeBloc.getProducts != null &&
                    homeBloc.categories != null
                ? RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.onEdge,
                    onRefresh: () async =>
                        BlocProvider.of<HomeBloc>(context).add(MainPage()),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HomeCarousalSlider(
                                items: homeBloc.getBanners!.data),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Categories',
                              style: getMediumStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s32),
                            ),
                            SizedBox(
                              height: 100.h,
                              child: HomeCategoriesList(
                                  categories: homeBloc.categories!),
                            ),
                            Text(
                              'New Products',
                              style: getMediumStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s32),
                            ),
                            HomeProductsList(items: homeBloc.getProducts!),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
