import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/cachehelper/cachehelper.dart';
import '../widgets/home_appbar.dart';

import '../widgets/home_carousal_slider.dart';
import '../widgets/home_categories_list.dart';
import '../widgets/home_products_list.dart';
import '../widgets/my_searchFiled.dart';
import '../widgets/my_snakebar.dart';
import 'package:badges/badges.dart' as badges;

import 'get_favorites.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  bool showBadge = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(

      listener: (context, state) {
        if (state is IsFavSuccess) {
          mySnakeBar(message: state.message, context: context);
        }
        if (state is HomeSuccess) {
          HomeBloc().add(GetFavorites());

        }

        },



      builder: (context, state) {
        showBadge = true  ;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[500],
              title: const SearchField(
                hintText: 'Search',
              ),
              actions: [
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: -1),
                  showBadge: showBadge,
                  ignorePointer: false,
                  onTap: () {},
                  badgeContent: Text('${CacheHelper.getData(key: 'favorites') ?? 0}'),
                  badgeAnimation: const badges.BadgeAnimation.slide(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.red,
                    padding: const EdgeInsets.all(5),
                    borderRadius: BorderRadius.circular(10.r),
                    //borderSide: const BorderSide(color: Colors.white, width: 1),

                    elevation: 0,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GetFavorite(),
                            ));

                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.person))
              ],
            ),
            body: HomeBloc.getBanners != null &&
                    HomeBloc.getProducts != null &&
                    HomeBloc.categories != null
                ? RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    onRefresh: () async =>
                        BlocProvider.of<HomeBloc>(context).add(MainPage()),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const HomeCarousalSlider(),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text('Categories',style:  GoogleFonts.aBeeZee(fontSize: 25 ,color: Colors.black),),
                            SizedBox(
                              height: 100.h,
                              child: const HomeCategoriesList(),
                            ),
                            Text('New Products',style:  GoogleFonts.aBeeZee(fontSize: 25 ,color: Colors.black),),

                            HomeProductsList(state: state),
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
