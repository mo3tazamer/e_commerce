import 'package:e_commerce/core/theme/color_manager.dart';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;


import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/route.dart';


import 'my_searchFiled.dart';

//ignore: must_be_immutable
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  HomeAppBar(
      {super.key, this.showBadge = false, this.favCount, this.onPressed});
  int? favCount;
  bool showBadge;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const SearchField(
        hintText: 'Search',
      ),
      actions: [
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: -10, end: -1),
          showBadge: showBadge,
          onTap: () {},
          badgeContent: Text(
            '$favCount ',
            style: const TextStyle(color: Colors.white),
          ),
          badgeAnimation: const badges.BadgeAnimation.slide(
            animationDuration: Duration(seconds: 1),
            colorChangeAnimationDuration: Duration(seconds: 1),
            loopAnimation: false,
            curve: Curves.fastOutSlowIn,
            colorChangeAnimationCurve: Curves.easeInCubic,
          ),
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: ColorManager.red,
            padding: const EdgeInsets.all(5),
            borderRadius: BorderRadius.circular(10.r),
            //borderSide: const BorderSide(color: Colors.white, width: 1),

            elevation: 0,
          ),
          child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.favorite,
                color: ColorManager.darkGrey,
                size: 30,
              )),
        ),
        IconButton(
            onPressed: () {
              // UserBloc().add(ProFileUserEvent());
              Navigator.pushNamed(context, AppRoute.profile);
            },
            icon: const Icon(
              Icons.person_pin_sharp,
              color: ColorManager.darkGrey,
              size: 30,
            ))
      ],
    );
  }
}
