import 'package:all_in_one3/src/features/employee_module/web/my_profile/my_profile_mobile_emp.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SideNavBarEmployee extends StatelessWidget {
  final bool jobDropdownOpen;
  final bool screenLarge;
  final Function(bool) onChangedjobDropdown;
  final Function(String) onChangedNavigation;
  const SideNavBarEmployee(
      {super.key,
      required this.jobDropdownOpen,
      required this.screenLarge,
      required this.onChangedjobDropdown,
      required this.onChangedNavigation});

  // @override
  // State<ResponsiveLayoutDashboardFirstTime> createState() =>
  //     _ResponsiveLayoutDashboardFirstTimeState();
// }

// class _ResponsiveLayoutDashboardFirstTimeState
//     extends State<ResponsiveLayoutDashboardFirstTime> {
  static const List<String> jobDropdownList = [
    AppStrings.savedJobs,
    AppStrings.appliedJobs
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        if (!screenLarge) {
          return Container(
            width: 80,
            color: CommonColor.whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Colors.white, CommonColor.greyColor1],
                        ),
                        border: Border(
                          left: BorderSide(color: CommonColor.greyColor2),
                          top: BorderSide(color: CommonColor.greyColor2),
                          right: BorderSide(color: CommonColor.greyColor2),
                          bottom: BorderSide(
                              width: 0.50, color: CommonColor.greyColor2),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          onChangedNavigation("home");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28, right: 21),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImageConstant.aioLogo,
                                width: 24,
                                height: 24,
                                fit: BoxFit.fill,
                              ),
                              // const SizedBox(
                              //   width: 8,
                              // ),
                              // const TextWidget(
                              //     text: AppStrings.allInOne,
                              //     color: CommonColor.headingTextColor1,
                              //     maxLine: 1,
                              //     fontFamily: AppStrings.sfProDisplay,
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Colors.white, CommonColor.greyColor1],
                        ),
                        border: Border(
                          left: BorderSide(color: CommonColor.greyColor2),
                          top: BorderSide(color: CommonColor.greyColor2),
                          right: BorderSide(color: CommonColor.greyColor2),
                          bottom: BorderSide(
                              width: 0.50, color: CommonColor.greyColor2),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          onChangedNavigation(AppStrings.courses);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28, right: 21),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImageConstant.bookOpenLogo,
                                width: 24,
                                height: 24,
                                fit: BoxFit.fill,
                              ),
                              // const SizedBox(
                              //   width: 8,
                              // ),
                              // const TextWidget(
                              //     text: AppStrings.dashboard,
                              //     color: CommonColor.headingTextColor1,
                              //     maxLine: 1,
                              //     fontFamily: AppStrings.sfProDisplay,
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 1,
                      color: CommonColor.greyColor2,
                    ),
                    Container(
                      height: 80,
                      alignment: Alignment.center,
                      color: CommonColor.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage(ImageConstant.profilePic),
                            ),
                            // const SizedBox(
                            //   width: 8,
                            // ),
                            // const TextWidget(
                            //     text: 'Joydeep C',
                            //     color: CommonColor.headingTextColor1,
                            //     maxLine: 1,
                            //     fontFamily: AppStrings.sfProDisplay,
                            //     fontWeight: FontWeight.w400,
                            //     fontSize: 16),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: CommonColor.headingTextColor1,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Container(
            width: 240,
            color: CommonColor.whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Colors.white, CommonColor.greyColor1],
                        ),
                        border: Border(
                          left: BorderSide(color: CommonColor.greyColor2),
                          top: BorderSide(color: CommonColor.greyColor2),
                          right: BorderSide(color: CommonColor.greyColor2),
                          bottom: BorderSide(
                              width: 0.50, color: CommonColor.greyColor2),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          onChangedNavigation("home");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28, right: 21),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImageConstant.aioLogo,
                                width: 24,
                                height: 24,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const TextWidget(
                                  text: AppStrings.allInOne,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.sfProDisplay,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Colors.white, CommonColor.greyColor1],
                        ),
                        border: Border(
                          left: BorderSide(color: CommonColor.greyColor2),
                          top: BorderSide(color: CommonColor.greyColor2),
                          right: BorderSide(color: CommonColor.greyColor2),
                          bottom: BorderSide(
                              width: 0.50, color: CommonColor.greyColor2),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          onChangedNavigation(AppStrings.courses);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28, right: 21),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImageConstant.bookOpenLogo,
                                width: 24,
                                height: 24,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const TextWidget(
                                  text: AppStrings.courses,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.sfProDisplay,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 1,
                      color: CommonColor.greyColor2,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyProfileEmployeeMobile(),
                          ),
                        );
                      },
                      child: Container(
                        height: 80,
                        alignment: Alignment.center,
                        color: CommonColor.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    AssetImage(ImageConstant.profilePic),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const TextWidget(
                                  text: 'Joydeep C',
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.sfProDisplay,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: CommonColor.headingTextColor1,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
