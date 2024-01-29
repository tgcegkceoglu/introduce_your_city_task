import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  news,
  placeToVisit,
  traditionalCuisine,
  category,
  categoryDetail;

  CollectionReference get reference =>FirebaseFirestore.instance.collection(name);
}