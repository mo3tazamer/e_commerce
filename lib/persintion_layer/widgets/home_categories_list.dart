import 'package:flutter/material.dart';

import '../contollers/home_bloc.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList ({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      key: const PageStorageKey<String>('page'),
      scrollDirection: Axis.horizontal,
      padding:  const EdgeInsets.all(10),
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
    );
  }
}
