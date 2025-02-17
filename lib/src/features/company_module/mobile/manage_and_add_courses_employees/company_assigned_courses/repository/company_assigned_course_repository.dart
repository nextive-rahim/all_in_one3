import 'package:all_in_one3/src/core/network/endpoints.dart';
import 'package:all_in_one3/src/core/network/rest_client.dart';

class CompanyAssignedCourseRepository {
  Future<dynamic> commanpanyAssignedCourse(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.addCourseEmployeeUrl,
      data,
    );
    return res.data;
  }
}
