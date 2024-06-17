import '../clients/tech_stack_api_client.dart';
import '../models/tech_stack.dart';

class TechStackDataRepository {
  const TechStackDataRepository({
    TechStackApiClient? techStackApiClient,
  }) : _techStackApiClient = techStackApiClient ?? const TechStackApiClient();

  final TechStackApiClient _techStackApiClient;

  Future<List<TechStack>?> getAllTechStackDatas() async => await _techStackApiClient.fetchAllTechStackDatas();
}
