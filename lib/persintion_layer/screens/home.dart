import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../contollers/userBloc/userEvents.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_carousal_slider.dart';
import '../widgets/home_categories_list.dart';
import '../widgets/home_products_list.dart';

import '../widgets/my_snakebar.dart';



//ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   bool showBadge = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(  create:   (context) => HomeBloc()..add(MainPage())..add(GetFavorites()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is IsFavSuccess) {
            mySnakeBar(message: state.message, context: context);
          }

        },
        builder: (context, state) {
          HomeAppBar.showBadge = true;
          return Scaffold(
              appBar: HomeAppBar(),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const HomeCarousalSlider(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Categories',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 25, color: Colors.black),
                              ),
                              SizedBox(
                                height: 100.h,
                                child: const HomeCategoriesList(),
                              ),
                              Text(
                                'New Products',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 25, color: Colors.black),
                              ),
                               HomeProductsList(),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
