import 'package:e_commerce/core/theme/font_manager.dart';
import 'package:e_commerce/core/theme/textstyle_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/color_manager.dart';

import '../../domain_layer/entites/products/products.dart';
import '../contollers/home_bloc.dart';

class HomeProductsList extends StatelessWidget {
  const HomeProductsList({super.key, required this.items});
  final List<Products> items;
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.w),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0.h / 1.6.h,
          mainAxisSpacing: 1.h,
          crossAxisSpacing: 1.w,
          crossAxisCount: 2),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                '${items[index].image}',
                scale: 4.0,
                height: 145.h,
                width: double.infinity.w,
              ),
              if ('${items[index].discount}' != '0')
                Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Discount',
                      style: TextStyle(fontSize: 12.sp),
                    ))
            ],
          ),
          Text(
            '${items[index].name}',
            overflow: TextOverflow.clip,
            maxLines: 2,
            style: getLightStyle(
                color: ColorManager.black,
                fontSize: FontSize.s12.sp,
                height: 1.3.h),
          ),
          Row(
            children: [
              Text(
                ' ${items[index].price.round()}',
                style: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s12.sp),
              ),
              SizedBox(
                width: 4.w,
              ),
              if ('${items[index].discount}' != '0')
                Text(
                  ' ${items[index].oldPrice.round()}',
                  style: getSemiBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s12.sp,
                      textDecoration: TextDecoration.lineThrough),
                ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(InFav(favId: items[index].id));
                    //BlocProvider.of<HomeBloc>(context).add(MainPage());
                  },
                  icon: Icon(
                      HomeBloc.fav[items[index].id] ==
                              false
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color: ColorManager.primary))
            ],
          ),
        ],
      ),
    );
  }
}
