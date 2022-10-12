import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:list_search/country_model.dart';

class CountryProvider extends ChangeNotifier {
  List<Country> list = [
    Country("India"),
    Country("USA"),
    Country("UAE"),
    Country("Germany"),
    Country("France"),
    Country("Japan"),
    Country("Brazil"),
    Country("Greece"),
    Country("Canada"),
  ];

  List<Country> searchedList = [];

  void changeSearchString(String search) {
    searchedList.clear();
    for (Country l in list) {
      if (l.name.contains(search)) {
        searchedList.add(l);
        notifyListeners();
      }
    }
  }
}
