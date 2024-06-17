import 'package:flutter_my_archive/datas/clients/profile_api_client.dart';
import 'package:flutter_my_archive/datas/models/profile.dart';

class ProfileDataRepository {
  const ProfileDataRepository({
    ProfileAPIClient? profileAPIClient,
  }) : _profileAPIClient = profileAPIClient ?? const ProfileAPIClient();

  final ProfileAPIClient _profileAPIClient;

  Future<Profile?> getProfileData() async => await _profileAPIClient.fetchLastProfileDatas();

  void onDispose() {}
}
