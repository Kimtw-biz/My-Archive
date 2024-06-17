import 'package:flutter_my_archive/datas/clients/career_api_client.dart';
import 'package:flutter_my_archive/datas/models/career.dart';

class CareerDataRepository {
  const CareerDataRepository({
    CareerApiClient? careerApiClient,
  }) : _careerApiClient = careerApiClient ?? const CareerApiClient();

  final CareerApiClient _careerApiClient;

  Future<List<Career>?> getAllCareerDatas() async => await _careerApiClient.fetchAllCareerDatas();

  void onDispose() {}
}
