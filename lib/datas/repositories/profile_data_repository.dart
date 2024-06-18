import '../clients/profile_api_client.dart';
import '../models/profile.dart';

class ProfileDataRepository {
  const ProfileDataRepository({
    ProfileAPIClient? profileAPIClient,
  }) : _profileAPIClient = profileAPIClient ?? const ProfileAPIClient();

  final ProfileAPIClient _profileAPIClient;

  Future<Profile?> getProfileData() async => await _profileAPIClient.fetchLastProfileDatas();

  void onDispose() {}
}
