import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/favourites_provider.dart';
import 'favourites_view.dart';

class FavouritesPicker extends StatefulWidget {
  const FavouritesPicker({Key? key}) : super(key: key);

  @override
  State<FavouritesPicker> createState() => _FavouritesPickerState();
}

class _FavouritesPickerState extends State<FavouritesPicker> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites Picker"),

        actions: [
          GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouritesScreen())),child: const Icon(Icons.navigate_next_outlined)),
          const SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 100,
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
