import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/widgets/logger.dart';
import 'package:all_in_one3/src/features/common_features/profile/model/profile_response_model.dart';
import 'package:all_in_one3/src/features/common_features/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileViewController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();

  RxBool rememberMe = false.obs;

  toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  @override
  void onInit() async {
    await getUser();
    // TODO: implement onInit
    super.onInit();
  }

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late ProfileResponseModel profileResponseModel;
  UserModel? userModel;

  Future<ProfileResponseModel> getUser() async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {};

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.profile(requestBody);

      profileResponseModel = ProfileResponseModel.fromJson(res);
      userModel = profileResponseModel.data!;
      print(' Name : ${userModel!.name}');
      _pageStateController(PageState.success);

      return profileResponseModel;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return profileResponseModel;
    }
  }

  /// Text Editing Controllers
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clearTextFields() {
    userNameController.clear();
    passwordController.clear();
  }
}
