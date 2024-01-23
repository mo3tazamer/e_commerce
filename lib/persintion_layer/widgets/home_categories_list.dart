import 'package:flutter/material.dart';

import '../../domain_layer/entites/categories/categories.dart';

// ignore: must_be_immutable
class HomeCategoriesList extends StatelessWidget {
   HomeCategoriesList ({super.key,  this.categories});
   Categories? categories;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      key: const PageStorageKey<String>('page'),
      scrollDirection: Axis.horizontal,
      padding:  const EdgeInsets.all(10),
      itemCount: categories!.data.length,
      itemBuilder: (context, index) {
        {
          return Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                categories!.data[index].image,
              ));
        }
      },
    );
  }
}
