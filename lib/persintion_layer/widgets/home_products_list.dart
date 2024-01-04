import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../contollers/home_bloc.dart';

class HomeProductsList extends StatelessWidget {
  HomeProductsList({super.key, required this.state});
  HomeState state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.w),
      itemCount: HomeBloc.getProducts!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0.h / 1.6.h,
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
                '${HomeBloc.getProducts![index].image}',
                height: 145.h,
                width: double.infinity,
              ),
              if ('${HomeBloc.getProducts![index].discount}' != '0')
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
            '${HomeBloc.getProducts![index].name}',
            overflow: TextOverflow.clip,
            maxLines: 2,
            style: TextStyle(fontSize: 15.sp, height: 1.3),
          ),
          Row(
            children: [
              Text(
                ' ${HomeBloc.getProducts![index].price.round()}',
                style: TextStyle(fontSize: 15.sp, color: Colors.deepOrange),
              ),
              SizedBox(
                width: 4.w,
              ),
              if ('${HomeBloc.getProducts![index].discount}' != '0')
                Text(
                  ' ${HomeBloc.getProducts![index].oldPrice.round()}',
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(InFav(favId: HomeBloc.getProducts![index].id));
                    //BlocProvider.of<HomeBloc>(context).add(MainPage());
                  },
                  icon: Icon(
                      HomeBloc.fav[HomeBloc.getProducts![index].id] == false
                          ? Icons.favorite_border
                          : Icons.favorite))
            ],
          ),
        ],
      ),
    );
  }
}
