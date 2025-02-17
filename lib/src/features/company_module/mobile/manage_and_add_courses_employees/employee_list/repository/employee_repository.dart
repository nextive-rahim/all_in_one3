import 'package:all_in_one3/src/core/network/endpoints.dart';
import 'package:all_in_one3/src/core/network/rest_client.dart';

class CompanyEmployeeListRepository {
  Future<dynamic> fetchhEmployeeList(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.getEmployeeUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> deleteEmployee(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.deleteEmployeeUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> deleteAssingedCourse(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.deleteAssignedCourse,
      data,
    );
    return res.data;
  }
  // Future<dynamic> otherCompanyJobs(Map<String, dynamic> data) async {
  //   final res = await RestClient.dev().post(
  //     APIType.PROTECTED,
  //     CompanyApiEndpoints.otherCompanyJobs,
  //     data,
  //   );
  //   return res.data;
  // }

  // Future<dynamic> applyJob(Map<String, dynamic> data) async {
  //   final res = await RestClient.dev().post(
  //     APIType.PROTECTED,
  //     StudentApiEndpoints.applyJobUrl,
  //     data,
  //   );
  //   return res.data;
  // }

  // Future<dynamic> saveJob(Map<String, dynamic> data) async {
  //   final res = await RestClient.dev().post(
  //     APIType.PROTECTED,
  //     StudentApiEndpoints.saveJobUrl,
  //     data,
  //   );
  //   return res.data;
  // }
}
