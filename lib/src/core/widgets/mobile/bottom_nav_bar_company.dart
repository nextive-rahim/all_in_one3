import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/widgets/logout_button.dart';
import 'package:all_in_one3/src/core/widgets/mobile/bottom_nav_bar_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_invoice/controller/company_invoice_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_invoice/view/generate_invoice_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_profile/view/comapny_profile_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/root/presentation/view/company_all_jobs_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/view/company_employee_list.dart';
import 'package:all_in_one3/src/features/company_module/mobile/payment/company_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';

class BottomNavBarCompany extends StatefulWidget {
  const BottomNavBarCompany({super.key});

  @override
  State<BottomNavBarCompany> createState() => _BottomNavBarCompanyState();
}

class _BottomNavBarCompanyState extends State<BottomNavBarCompany> {
  final controller = Get.put(DashboardViewController());
  final invoiceController = Get.put(CompanyInvoiceViewController());
  final List<Widget> _children = <Widget>[
    const CompanyAllJobsMobilePage(),
    const CompanyEmployeeListPageMobile(),
    const CompanyPaymentPageMobile(),
    const GenerateCompanyInvoice(),
    const CompanyProfilePage()
  ];

  static const double _borderRadius = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //bool value;
    return Scaffold(
      appBar: CompanyHomeAppBar(),
      body: Obx(
        () {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              body: IndexedStack(
                index: controller.currentIndex,
                children: _children,
              ),
              bottomNavigationBar: Obx(
                () {
                  return Visibility(
                    visible: controller.navBarVisibility,
                    child: Container(
                      //  height: Platform.isAndroid ? 80 : null,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(_borderRadius),
                          topLeft: Radius.circular(_borderRadius),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.lightBlack10,
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: Offset(0, -1)),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(_borderRadius),
                          topRight: Radius.circular(_borderRadius),
                        ),
                        child: BottomNavigationBar(
                          type: BottomNavigationBarType.fixed,
                          items: <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                              icon: _buildIcon(ImageConstant.home, 0),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: _buildIcon(ImageConstant.employees, 1),
                              label: 'Employee',
                            ),
                            BottomNavigationBarItem(
                              icon: _buildIcon(ImageConstant.payment, 2),
                              label: 'Payment',
                            ),
                            BottomNavigationBarItem(
                              icon: _buildIcon(ImageConstant.file, 3),
                              label: 'Invoice',
                            ),
                            BottomNavigationBarItem(
                              icon: _buildIcon(ImageConstant.users, 4),
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
                },
              ),
            ),
          );
        },
      ),
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
      color: controller.currentIndex == index
          ? AppColors.selectedNavItem
          : AppColors.unselectedNavItem,
      height: 23,
      width: 23,
      fit: BoxFit.fill,
      cacheHeight: 73,
      cacheWidth: 73,
    );
  }
}

class CompanyHomeAppBar extends AppBar {
  CompanyHomeAppBar({super.key})
      : super(
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          backgroundColor: CommonColor.whiteColor,
          elevation: 0,
          // shadowColor: AppColors.lightBlack10.withOpacity(0.4),
          toolbarHeight: 65,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  ImageConstant.aioLogo,
                  fit: BoxFit.contain,
                  cacheHeight: 105,
                  cacheWidth: 388,
                ),
              ),
              const Text(
                'All In One',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const LogoutButton()
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         GestureDetector(
              //           onTap: () => Get.toNamed(Routes.notification),
              //           child: Container(
              //             height: 40,
              //             width: 40,
              //             decoration: BoxDecoration(
              //               color: AppColors.grey100,
              //               borderRadius: BorderRadius.circular(8),
              //               border: Border.all(
              //                 color: AppColors.lightBlack10,
              //                 width: 1,
              //               ),
              //             ),
              //             padding: const EdgeInsets.all(8),
              //             child: const Icon(
              //               Icons.notifications_none_outlined,
              //               color: CommonColor.headingTextColor1,
              //             ),
              //           ),
              //         ),
              //         const SizedBox(width: 10),
              //       ],
              //     ),
            ],
          ),
        );
}
