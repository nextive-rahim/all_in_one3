import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/widgets/logger.dart';
import 'package:all_in_one3/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/repository/job_repository.dart';
import 'package:get/get.dart';

class JobsViewController extends GetxController {
  final JobListRepository _repository = JobListRepository();

  /// Page State
  final Rx<PageState> pageStateController = Rx(PageState.initial);

  get pageState => pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxBool isLoadingSavedJob = false.obs;
  final RxBool isLoadingAppliedJob = false.obs;
  //late JobResponseModel jobListResponse;
  RxList<JobModel> savedJobList = <JobModel>[].obs;

  RxList<JobModel> companyJobList = <JobModel>[].obs;
  RxList<JobModel> appiedJobList = <JobModel>[].obs;
  @override
  void onInit() async {
    await getjobList();

    super.onInit();
  }

  Future<void> getjobList() async {
    Map<String, dynamic> requestBody = {
      //"course_id": courseId,
    };

    //Log.debug(requestBody.toString());

    try {
      final res = await _repository.fetchJobList(requestBody);
      JobResponseModel jobListResponse = JobResponseModel.fromJson(res);
      companyJobList.value = jobListResponse.data ?? [];
      savedJobList.value =
          jobListResponse.data!.where((v) => v.isSaved != 0).toList();
      appiedJobList.value =
          jobListResponse.data!.where((v) => v.isApplied != 0).toList();
      //  pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      // pageStateController(PageState.error);
      return;
    }
  }

  Future<RegistrationResponseModel> saveJob(int id) async {
    // _pageStateController(PageState.loading);
    isLoadingSavedJob.value = true;
    Map<String, dynamic> body = {"job_id": id};

    try {
      final res = await _repository.saveJob(body);

      signupModel = RegistrationResponseModel.fromJson(res);
      isLoadingSavedJob.value = false;
      return signupModel;
      // clearTextFields();
    } catch (e, stackTrace) {
      isLoadingSavedJob.value = false;
      Log.error(e.toString());
      Log.error(stackTrace.toString());
    }
    return signupModel;
  }

  Future<RegistrationResponseModel> deleteSaveJob(int id) async {
    Map<String, dynamic> body = {"job_id": id};

    try {
      final res = await _repository.deleteSaveJob(body);

      signupModel = RegistrationResponseModel.fromJson(res);

      getjobList();
      return signupModel;

      // clearTextFields();
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
    }
    return signupModel;
  }

  Future<RegistrationResponseModel> applyJob(int id) async {
    isLoadingAppliedJob.value = true;

    Map<String, dynamic> body = {"company_job_id": id};

    try {
      final res = await _repository.applyJob(body);

      signupModel = RegistrationResponseModel.fromJson(res);
      isLoadingAppliedJob.value = false;
      return signupModel;
    } catch (e, stackTrace) {
      isLoadingAppliedJob.value = false;
      Log.error(e.toString());
      Log.error(stackTrace.toString());
    }
    return signupModel;
  }
}
