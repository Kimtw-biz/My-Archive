import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/career.dart';

class CareerApiClient {
  const CareerApiClient();

  Future<List<Career>?> fetchAllCareerDatas() async => await _fetchAllCareerDatasFromFirebaseFirestore();

  Future<List<Career>?> _fetchAllCareerDatasFromFirebaseFirestore() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    // final Query<Map<String, dynamic>> ref = db.collectionGroup("careers");
    final Query<Map<String, dynamic>> ref = db.collection("careers").orderBy(
          "first_day_of_work",
          descending: true,
        );

    return await ref.get().then((snapshot) {
      final List<Map<String, dynamic>> datas = snapshot.docs.map((e) => e.data()).toList();

      // datas.sort((a, b) => b["first_day_of_work"].compareTo(a["first_day_of_work"]));

      return datas.map((e) => Career.fromMap(e)).toList();
    }).onError<FirebaseException>(
      (error, stackTrace) => switch (error.code) {
        _ => throw error,
      },
    );
  }
}
