import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/favourites_provider.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  @override
  Widget build(BuildContext context) {
    final favsProvider = Provider.of<FavouritesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        centerTitle: true,
      ),
      body: Column(
        children: [
            Expanded(
                child: ListView.builder(
                    itemCount: favsProvider.getFavs.length,
                    itemBuilder: (context, index) {
                    return Consumer<FavouritesProvider>(builder:(context, myProvider, child) {
                     return  ListTile(
                        onTap: () {
                          if(!myProvider.getFavs.contains(index)){
                            myProvider.addToFavs(index);
                          } else {
                            myProvider.removeFromFavs(index);
                          }
                        },
                        title: Text("Item $index"),
                        trailing: myProvider.getFavs.contains(index) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline_rounded),
                      );
                    }
                    );
                  }
                )
            ),
        ],
      ),
    );
  }
}
