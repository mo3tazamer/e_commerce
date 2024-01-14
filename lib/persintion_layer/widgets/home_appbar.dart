import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/cachehelper/cachehelper.dart';

import '../../core/route.dart';

import 'my_searchFiled.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  // ignore: non_constant_identifier_names
  HomeAppBar({super.key});
  static bool showBadge = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                Navigator.pushNamed(context, AppRoute.favorites);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
        ),
        IconButton(
            onPressed: () {
              // UserBloc().add(ProFileUserEvent());
              Navigator.pushNamed(context, AppRoute.profile);
            },
            icon: const Icon(Icons.person))
      ],
    );
  }
}
