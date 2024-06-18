import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/profile.dart';

class ProfileAPIClient {
  const ProfileAPIClient();

  Future<void> fetchAllProfileDatas() async => await _fetchAllProfileDatasFromFirebaseFirestore();

  Future<Profile?> fetchLastProfileDatas() async => await _fetchLastProfileDatasFromFirebaseFirestore();

  Future<void> _fetchAllProfileDatasFromFirebaseFirestore() async => throw UnimplementedError();

  Future<Profile?> _fetchLastProfileDatasFromFirebaseFirestore() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    final Query<Map<String, dynamic>> ref = db.collection("profiles").orderBy(
          "updated_at",
          descending: true,
        );

    return await ref.get().then((snapshot) {
      return Profile.fromMap(snapshot.docs.first.data());
    }).onError<FirebaseException>(
      (error, stackTrace) => switch (error.code) {
        _ => throw error,
      },
    );
  }
}
