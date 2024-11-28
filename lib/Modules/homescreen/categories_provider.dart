import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'categories_Model.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider with ChangeNotifier {
  final FirebaseFirestore dB = FirebaseFirestore.instance;
  List<CategoriesModel> categoriesList = [];

  // Fetch categories data from Firestore
  Future<List<CategoriesModel>> getCategoriesData() async {
    List<CategoriesModel> newlist = [];

    // Get the data from Firestore collection "categories"
    QuerySnapshot data = await dB.collection("categories").get();

    for (QueryDocumentSnapshot element in data.docs) {
      if (element.exists) {
        // Convert the document data into CategoriesModel and add it to the list
        CategoriesModel category =
            CategoriesModel.fromJson(element.data() as Map<String, dynamic>);
        newlist.add(category);
      }
    }

    // Update the categoriesList and notify listeners only once
    categoriesList = newlist;
    notifyListeners();

    return categoriesList;
  }
}
