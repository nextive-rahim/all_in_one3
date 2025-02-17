import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/widgets/mobile/bottom_nav_bar_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one3/src/features/interviewer_module/mobile/interviews/all_interviews/controller/submit_interview_feedback_view_controller.dart';
import 'package:all_in_one3/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/interview_card_loading.dart';
import 'package:all_in_one3/src/features/interviewer_module/mobile/interviews/interviewer_payment/view/interviewer_payment_home_page_mobile.dart';
import 'package:all_in_one3/src/features/interviewer_module/mobile/interviews/interviewer_test_request/view/interviewer_home_page_mobile.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/view/profile_page.dart';
import 'package:all_in_one3/src/features/student_module/root/widget/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarInterviewer extends StatefulWidget {
  const BottomNavBarInterviewer({super.key});

  @override
  State<BottomNavBarInterviewer> createState() =>
      _BottomNavBarInterviewerState();
}

class _BottomNavBarInterviewerState extends State<BottomNavBarInterviewer> {
  final controller = Get.put(DashboardViewController());
  final submitcontroller = Get.put(SubmittedInterviewFeedbackViewController());
  final profileUpdateController = Get.put(UpdateProfileiewController());

  final List<Widget> _isApprovedchildren = <Widget>[
    const InterviewerHomePageMobile(),
    const InterviewerPaymentHomePageMobile(),
    ProfilePage(),
  ];
  final List<Widget> _isNotApprovedchildren = <Widget>[
    const InterviewerHomePageMobile(),
    ProfilePage(),
  ];

  static const double _borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    final profilecontroller = Get.put(ProfileViewController());
    SizeConfig().init(context);
    //bool value;
    return Scaffold(
      appBar: HomeAppBar(context: context),
      body: Obx(() {
        if (profilecontroller.pageState == PageState.loading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 0,
                // left: 15,
                // right: 15,
                bottom: 80,
              ),
              child: InterviewCardLoading(),
            ),
          );
        }
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            body: IndexedStack(
              index: controller.currentIndex,
              children:
                  profilecontroller.profileResponseModel.testRequest == null ||
                          profilecontroller
                                  .profileResponseModel
                                  .testRequest
                                  ?.status !=
                              3
                      ? _isNotApprovedchildren
                      : _isApprovedchildren,
            ),
            bottomNavigationBar: Obx(() {
              return Visibility(
                visible: controller.navBarVisibility,
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(_borderRadius),
                      topLeft: Radius.circular(_borderRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CommonColor.purpleColor1,
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(0, -1),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(_borderRadius),
                      topRight: Radius.circular(_borderRadius),
                    ),
                    child:
                        profilecontroller.profileResponseModel.testRequest ==
                                    null ||
                                profilecontroller
                                        .profileResponseModel
                                        .testRequest
                                        ?.status !=
                                    3
                            ? BottomNavigationBar(
                              type: BottomNavigationBarType.fixed,
                              items: <BottomNavigationBarItem>[
                                BottomNavigationBarItem(
                                  icon: _buildIcon(ImageConstant.home, 0),
                                  label: 'Home',
                                ),
                                BottomNavigationBarItem(
                                  icon: _buildIcon(ImageConstant.users, 2),
                                  label: 'Profile',
                                ),
                              ],
                              currentIndex: controller.currentIndex,
                              selectedItemColor: AppColors.selectedNavItem,
                              onTap: controller.updateIndex,
                            )
                            : BottomNavigationBar(
                              type: BottomNavigationBarType.fixed,
                              items: <BottomNavigationBarItem>[
                                BottomNavigationBarItem(
                                  icon: _buildIcon(ImageConstant.home, 0),
                                  label: 'Home',
                                ),
                                BottomNavigationBarItem(
                                  icon: _buildIcon(ImageConstant.payment, 1),
                                  label: 'Payment',
                                ),
                                BottomNavigationBarItem(
                                  icon: _buildIcon(ImageConstant.users, 2),
                                  label: 'Profile',
                                ),
                              ],
                              currentIndex: controller.currentIndex,
                              selectedItemColor: AppColors.selectedNavItem,
                              onTap: controller.updateIndex,
                            ),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Future<bool> _onWillPop() async {
    if (controller.currentIndex == 0) {
      return true;
    } else {
      controller.updateIndex(0);
      return false;
    }
  }

  Image _buildIcon(String asset, int index) {
    return Image.asset(
      asset,
      color:
          controller.currentIndex == index
              ? AppColors.selectedNavItem
              : AppColors.unselectedNavItem,
      height: 28,
      width: 28,
      cacheHeight: 73,
      cacheWidth: 73,
    );
  }
}
