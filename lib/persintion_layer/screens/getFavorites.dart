// ignore_for_file: must_be_immutable

import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_snakebar.dart';

class GetFavorite extends StatelessWidget {
  GetFavorite({super.key});

  int item = -1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          body: HomeBloc.getFavorites != null && HomeBloc.getFavorites!.isNotEmpty
              ? Column(
                children: [
                  const SizedBox(height: 50,),
                  Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.all(15),
                        itemCount: HomeBloc.getFavorites!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  '${HomeBloc.getFavorites![index].image}',
                                  height: 150,
                                  width: double.infinity,
                                ),
                                if ('${HomeBloc.getFavorites![index].id}' != '0')
                                  Container(
                                      color: Colors.red,
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 8),
                                      child: const Text(
                                        'Discount',
                                        style: TextStyle(fontSize: 12),
                                      ))
                              ],
                            ),
                            Text(
                              '${HomeBloc.getFavorites![index].name}',
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                              style: const TextStyle(fontSize: 15, height: 1.3),
                            ),
                            Row(
                              children: [
                                Text(
                                  ' ${HomeBloc.getFavorites![index].price.round()}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.deepOrange),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                if ('${HomeBloc.getFavorites![index].discount}' !=
                                    '0')
                                  Text(
                                    ' ${HomeBloc.getFavorites![index].oldPrice.round()}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<HomeBloc>(context).add(InFav(
                                          favId: HomeBloc.getFavorites![index].id));
                                    },
                                    icon: Icon(HomeBloc.fav[
                                                HomeBloc.getFavorites![index].id] ==
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
              :  Center(child: Text('No Items',style: GoogleFonts.aBeeZee(fontSize: 25 ,color: Colors.grey[400]),)),
        );
      },
    );
  }
}
