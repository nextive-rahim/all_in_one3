import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/widgets/logger.dart';
import 'package:all_in_one3/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one3/src/features/common_features/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChangePasswordViewController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  RegistrationResponseModel loginModel = RegistrationResponseModel();

  Future<RegistrationResponseModel> changePassword(
    GlobalKey<FormState> formKey,
  ) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      'old_password': oldPasswordController.text,
      'new_password': newPasswordController.text,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.changePassword(requestBody);

      loginModel = RegistrationResponseModel.fromJson(res);

      _pageStateController(PageState.success);

      return loginModel;
      //clearTextFields();
      //  Get.offAllNamed(Routes.dashboard);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return loginModel;
    }
  }

  /// Text Editing Controllers
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  void clearTextFields() {
    oldPasswordController.clear();
    newPasswordController.clear();
  }
}
