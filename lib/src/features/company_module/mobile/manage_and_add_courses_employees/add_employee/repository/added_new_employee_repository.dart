import 'package:all_in_one3/src/core/network/endpoints.dart';
import 'package:all_in_one3/src/core/network/rest_client.dart';

class AddedNewEmployeeRepository {
  Future<dynamic> addedNewEmployee(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.companyAddEmployeeUrl,
      data,
    );
    return res.data;
  }
}
