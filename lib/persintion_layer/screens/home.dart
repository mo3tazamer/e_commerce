import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          mySnakeBar(message: state.message, context: context);
        }
        if (state is GetFavoritesSuccess) {
          HomeAppBar.showBadge = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: const HomeAppBar(),
            body: HomeBloc.getBanners != null &&
                    HomeBloc.getProducts != null &&
                    HomeBloc.categories != null
                ? RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    onRefresh: () async =>
                        BlocProvider.of<HomeBloc>(context).add(MainPage()),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const HomeCarousalSlider(),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 100.h,
                            child: const HomeCategoriesList(),
                          ),
                          HomeProductsList(),
                        ],
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
