import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/widgets/logger.dart';
import 'package:all_in_one3/src/features/common_features/authentication/forget_password/controller/forget_password_email_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/authentication/login/model/login_response_model.dart';
import 'package:all_in_one3/src/features/common_features/authentication/root/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationViewController extends GetxController {
  final AuthenticationRepository _repository = AuthenticationRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late LoginResponseModel loginModel;

  Future<void> otpverification(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      'username':
          Get.find<ForgetPasswordEmailViewController>().userNameController.text,
      'otp': otpController.text,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.otpVerification(requestBody);

      loginModel = LoginResponseModel.fromJson(res);

      _pageStateController(PageState.success);

      return;
      //clearTextFields();
      //  Get.offAllNamed(Routes.dashboard);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  /// Text Editing Controllers
  TextEditingController otpController = TextEditingController();

  void clearTextFields() {
    otpController.clear();
  }
}
