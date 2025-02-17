import 'package:all_in_one3/src/core/network/endpoints.dart';
import 'package:all_in_one3/src/core/network/rest_client.dart';

class CompanyAppliedJobRepository {
  Future<dynamic> companyAppliedjob(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.companyappliedJob,
      data,
    );
    return res.data;
  }
}
