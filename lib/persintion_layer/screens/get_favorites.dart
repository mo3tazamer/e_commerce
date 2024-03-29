import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/theme/font_manager.dart';
import 'package:e_commerce/core/theme/textstyle_manager.dart';
import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class GetFavorite extends StatelessWidget {
  const GetFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
      var  favorites =HomeBloc.getFavorites ;
        return Scaffold(
          body: favorites!.isNotEmpty
              ? Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: favorites.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.55,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.network(
                            '${favorites[index].image}',
                            height: 150.h,
                            width: double.infinity.w,
                          ),
                          if ('${favorites[index].id}' !=
                              '0')
                            Container(
                                color: ColorManager.red,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w),
                                child: Text(
                                  'Discount',
                                  style: getMediumStyle(
                                      color: ColorManager.black),
                                ))
                        ],
                      ),
                      Text(
                        '${favorites[index].name}',
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: getLightStyle(
                            color: ColorManager.black,
                            height: 1.3,
                            fontSize: FontSize.s14.sp),
                      ),
                      Row(
                        children: [
                          Text(
                            ' ${favorites[index].price.round()}',
                            style: getMediumStyle(
                                color: ColorManager.primary, fontSize: FontSize.s14.sp),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          if ('${favorites[index].discount}' !=
                              '0')
                            Text(
                              ' ${favorites[index].oldPrice.round()}',
                              style: getSemiBoldStyle(
                                  color: ColorManager.black, fontSize: FontSize.s14.sp,textDecoration: TextDecoration.lineThrough),
                            ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<HomeBloc>(context).add(
                                    InFav(
                                        favId: favorites[index].id));
                              },
                              icon: Icon(HomeBloc.fav[
                              favorites[index].id] ==
                                  false
                                  ? Icons.favorite_border
                                  : Icons.favorite))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
              : Center(
              child: Text(
                'No Items',
                style: GoogleFonts.aBeeZee(
                    fontSize: 25, color: Colors.grey[400]),
              )),
        );
      },
    );
  }
}