import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/tech_stack.dart';

class TechStackApiClient {
  const TechStackApiClient();

  Future<List<TechStack>?> fetchAllTechStackDatas() async => await _fetchAllTechStackDatasFromFirebaseFirestore();

  Future<List<TechStack>?> _fetchAllTechStackDatasFromFirebaseFirestore() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    final Query<Map<String, dynamic>> ref = db.collection("tech_stacks").orderBy("category");

    return await ref.get().then((snapshot) {
      final List<Map<String, dynamic>> datas = snapshot.docs.map((e) => e.data()).toList();

      return datas.map((e) => TechStack.fromMap(e)).toList();
    }).onError<FirebaseException>(
      (error, stackTrace) => switch (error.code) {
        _ => throw error,
      },
    );
  }
}
