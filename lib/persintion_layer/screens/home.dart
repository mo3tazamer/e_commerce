import 'package:carousel_slider/carousel_slider.dart';

import 'package:e_commerce/persintion_layer/components/my_snakebar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:e_commerce/persintion_layer/screens/getFavorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/searchFiled.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  int item = -1;
  bool showBadge = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is IsFavSuccess) {
          mySnakeBar(message: state.message, context: context);
        }
        if (state is GetFavoritesSuccess) {
          showBadge = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[500],
              title: SearchField(
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
                    borderRadius: BorderRadius.circular(10),
                    //borderSide: const BorderSide(color: Colors.white, width: 1),

                    elevation: 0,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetFavorite(),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselSlider(
                            items: HomeBloc.getBanners?.data
                                .map((item) => ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(0)),
                                      child: Image(
                                        image: NetworkImage(
                                          item.image,
                                        ),
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.medium,
                                      ),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                                viewportFraction: 1.0,
                                scrollPhysics: const BouncingScrollPhysics(),
                                autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                                autoPlay: true,
                                enableInfiniteScroll: true,
                                aspectRatio: 1.6),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              key: const PageStorageKey<String>('page'),
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(10),
                              itemCount: HomeBloc.categories!.data.length,
                              itemBuilder: (context, index) {
                                {
                                  return Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        HomeBloc.categories!.data[index].image,
                                      ));
                                }
                              },
                            ),
                          ),
                          GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(15),
                            itemCount: HomeBloc.getProducts!.length,
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
                                      '${HomeBloc.getProducts![index].image}',
                                      height: 150,
                                      width: double.infinity,
                                    ),
                                    if ('${HomeBloc.getProducts![index].discount}' !=
                                        '0')
                                      Container(
                                          color: Colors.red,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: const Text(
                                            'Discount',
                                            style: TextStyle(fontSize: 12),
                                          ))
                                  ],
                                ),
                                Text(
                                  '${HomeBloc.getProducts![index].name}',
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15, height: 1.3),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ' ${HomeBloc.getProducts![index].price.round()}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.deepOrange),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if ('${HomeBloc.getProducts![index].discount}' !=
                                        '0')
                                      Text(
                                        ' ${HomeBloc.getProducts![index].oldPrice.round()}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          item = index;

                                          BlocProvider.of<HomeBloc>(context)
                                              .add(InFav(
                                                  favId: HomeBloc
                                                      .getProducts![index].id));
                                          //BlocProvider.of<HomeBloc>(context).add(MainPage());
                                        },
                                        icon:
                                        state is! IsFavSuccess &&
                                                item == index
                                            ? const SizedBox(
                                                height: 12,
                                                width: 12,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.black,
                                                  strokeWidth: 1,
                                                ))
                                            :
                                        Icon(HomeBloc.fav[HomeBloc
                                                        .getProducts![index]
                                                        .id] ==
                                                    false
                                                ? Icons.favorite_border
                                                : Icons.favorite))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
