import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../contollers/home_bloc.dart';
import '../screens/get_favorites.dart';
import 'my_searchFiled.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
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
          badgeContent: Text('${HomeBloc.getFavorites?.length ?? 0}'),
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
