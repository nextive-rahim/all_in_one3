import 'package:all_in_one3/src/core/network/endpoints.dart';
import 'package:all_in_one3/src/core/network/rest_client.dart';

class CourseRegistrationRepository {
  Future<dynamic> courseRegistration(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.courseRegisterUrl,
      data,
    );
    return res.data;
  }
}
