import 'package:flutter/foundation.dart';

class FavouritesProvider with ChangeNotifier{
  final List<int> _favs = [];

  // GETTERS
  List<int> get getFavs => _favs;

  // SETTERS
  void addToFavs(int val){
    _favs.add(val);
    notifyListeners();
  }

  void removeFromFavs(int val){
    _favs.remove(val);
    notifyListeners();
  }

}