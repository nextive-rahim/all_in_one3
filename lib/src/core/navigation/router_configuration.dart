import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/widgets/mobile/bottom_nav_bar_company.dart';
import 'package:all_in_one3/src/core/widgets/mobile/bottom_nav_bar_employee.dart';
import 'package:all_in_one3/src/core/widgets/mobile/bottom_nav_bar_interviewer.dart';
import 'package:all_in_one3/src/core/widgets/mobile/bottom_nav_bar_student.dart';
import 'package:all_in_one3/src/features/common_features/authentication/forget_password/view/forget_password_email_page.dart';
import 'package:all_in_one3/src/features/common_features/authentication/forget_password/view/forget_password_page.dart';
import 'package:all_in_one3/src/features/common_features/authentication/forget_password/view/otp_verification_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/authentication/login/view/login_page.dart';
import 'package:all_in_one3/src/features/common_features/authentication/registration/view/choose_engagement_page.dart';
import 'package:all_in_one3/src/features/common_features/authentication/registration/view/registration_completed_page.dart';
import 'package:all_in_one3/src/features/common_features/authentication/registration/view/registration_page.dart';
import 'package:all_in_one3/src/features/common_features/profile/view/change_password_page.dart';
import 'package:all_in_one3/src/features/common_features/profile/view/profile_page.dart';
import 'package:all_in_one3/src/features/common_features/profile/view/profile_update_page.dart';
import 'package:all_in_one3/src/features/common_features/splash/splash_page.dart';
import 'package:all_in_one3/src/features/common_features/user_details/view/selected_interview_details_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_invoice/view/generate_invoice_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_invoice/view/invoice_view_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_applied_candidate_profile/view/company_job_applied_candidate_profile.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/post_new_job/view/post_company_new_job_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/root/presentation/view/company_all_jobs_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_profile/view/comapny_profile_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_profile/view/company_profile_update_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/view/company_add_employee.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/view/company_assigned_course_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/company_employee_profile/view/company_employee_profile_page.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/view/company_employee_list.dart';
import 'package:all_in_one3/src/features/company_module/mobile/payment/company_payment.dart';
import 'package:all_in_one3/src/features/student_module/mobile/appear_test_and_schedule_interview/view/appear_test_and_schedule_interview_mobile.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/course_details/root/view/course_details_mobile_page.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/view/category_wise_course_page.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/view/category_with_course_page.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/view/job_details_page_mobile.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/view/list_and_search_job_mobile.dart';
import 'package:all_in_one3/src/features/student_module/mobile/notification/view/notification_view_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'shellE');
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: Routes.splash,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return BottomNavBarStudent(
          navigationShell: navigationShell,
        ); // DashboardPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.homeTab,
              name: Routes.homeTab,
              pageBuilder: (context, state) => const CategoryWithCoursePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.jobTab,
              name: Routes.jobTab,
              pageBuilder:
                  (context, state) => const ListAndSearchJobStudentMobile(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.profileTab,
              name: Routes.profileTab,
              pageBuilder: (context, state) => ProfilePage(),
            ),
          ],
        ),
      ],
    ),

    /// Employee Shell Route
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return BottomNavBarEmployee(
          navigationShell: navigationShell,
        ); // DashboardPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.homeTabEmployee,
              name: Routes.homeTabEmployee,
              pageBuilder: (context, state) => const CategoryWithCoursePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.profileTabCompany,
              name: Routes.profileTabCompany,
              pageBuilder: (context, state) => ProfilePage(),
            ),
          ],
        ),
      ],
    ),

    /// Company Shell Route
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return BottomNavBarCompany(
          navigationShell: navigationShell,
        ); // DashboardPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.homeTabCompany,
              name: Routes.homeTabCompany,
              pageBuilder: (context, state) => const CompanyAllJobsMobilePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.companyEmployeeListTab,
              name: Routes.companyEmployeeListTab,
              pageBuilder:
                  (context, state) => const CompanyEmployeeListPageMobile(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.companyPaymentTab,
              name: Routes.companyPaymentTab,
              pageBuilder: (context, state) => const CompanyPaymentPageMobile(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.companyInvoiceTab,
              name: Routes.companyInvoiceTab,
              pageBuilder: (context, state) => const GenerateCompanyInvoice(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorEKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.companyProfileTab,
              name: Routes.companyProfileTab,
              pageBuilder: (context, state) => const CompanyProfilePage(),
            ),
          ],
        ),
      ],
    ),
    transitionGoRoute(
      path: Routes.splash,
      name: Routes.splash,
      pageBuilder: (context, state) => const SplashPage(),
    ),
    transitionGoRoute(
      path: Routes.login,
      name: Routes.login,
      pageBuilder: (context, state) => const LoginPage(),
    ),
    transitionGoRoute(
      path: Routes.engagement,
      name: Routes.engagement,
      pageBuilder: (context, state) {
        final String isFrom = state.uri.queryParameters['title'] ?? 'Null';

        return ChooseEngagementPage(title: isFrom);
      },
    ),
    transitionGoRoute(
      path: Routes.registration,
      name: Routes.registration,
      pageBuilder: (context, state) {
        final String userType = state.uri.queryParameters['userType'] ?? 'Null';
        return RegistrationPage(userTyper: userType);
      },
    ),
    transitionGoRoute(
      path: Routes.registrationCompleted,
      name: Routes.registrationCompleted,
      pageBuilder: (context, state) {
        return const RegistrationCompletedPage();
      },
    ),
    transitionGoRoute(
      path: Routes.forgetPasswordEmailPage,
      name: Routes.forgetPasswordEmailPage,
      pageBuilder: (context, state) {
        return const ForgetPasswordEmailPage();
      },
      routes: [
        transitionGoRoute(
          path: Routes.otpVerification,
          name: Routes.otpVerification,
          pageBuilder: (context, state) {
            return const OTPverificationPage();
          },
          routes: [
            transitionGoRoute(
              path: Routes.forgotPassword,
              name: Routes.forgotPassword,
              pageBuilder: (context, state) {
                return const ForgetPasswordPage();
              },
              routes: [],
            ),
          ],
        ),
        transitionGoRoute(
          path: Routes.categoryWiseCourse,
          name: Routes.categoryWiseCourse,
          pageBuilder: (context, state) {
            final String isFrom = state.uri.queryParameters['title'] ?? '';
            // final List<CourseModel> categoryWiseCourse =
            //     state.extra as List<CourseModel>;
            return CategoryWiseCoursePage(
              title: isFrom,
              // categoryWiseCourse: categoryWiseCourse,
            );
          },
          routes: [
            transitionGoRoute(
              path: Routes.courseDetailMobilePage,
              name: Routes.courseDetailMobilePage,
              pageBuilder: (context, state) {
                //final CourseModel courseModel = state.extra as CourseModel;
                return const CourseDetailMobilePage(
                  // collectinListData: courseModel,
                );
              },
            ),
            transitionGoRoute(
              path: Routes.appearTestAndScheduleInterviewMobilePage,
              name: Routes.appearTestAndScheduleInterviewMobilePage,
              pageBuilder: (context, state) {
                //final CourseModel courseModel = state.extra as CourseModel;
                return const AppearTestAndScheduleInterviewMobilePage(
                  // collectinListData: courseModel,
                );
              },
            ),
          ],
        ),
      ],
    ),
    transitionGoRoute(
      path: Routes.jobDetails,
      name: Routes.jobDetails,
      pageBuilder: (context, state) {
        final String isFrom = state.uri.queryParameters['isFrom'] ?? '';
        return JobDetailsPageMobile(isFrom: isFrom);
      },
    ),
    transitionGoRoute(
      path: Routes.companyProfileUpdatePage,
      name: Routes.companyProfileUpdatePage,
      pageBuilder: (context, state) {
        return const CompanyProfileUpdatePage();
      },
    ),
    transitionGoRoute(
      path: Routes.profileUpdatePage,
      name: Routes.profileUpdatePage,
      pageBuilder: (context, state) {
        return ProfileUpdatePage();
      },
    ),

    transitionGoRoute(
      path: Routes.changePassword,
      name: Routes.changePassword,
      pageBuilder: (context, state) {
        return const ChangePasswordPage();
      },
      routes: [
        // transitionGoRoute(
        //   path: Routes.payment,
        //   name: Routes.payment,
        //   pageBuilder: (context, state) {
        //     final String courseModel = state.uri.queryParameters['id'] ?? '';
        //     return CheckOutPage(id: courseModel);
        //   },
        // ),
        // transitionGoRoute(
        //   path: Routes.routine,
        //   name: Routes.routine,
        //   pageBuilder: (context, state) {
        //     final String link = state.uri.queryParameters['link'] ?? '';
        //     final String title = state.uri.queryParameters['title'] ?? '';
        //     return CourseRoutinePage(
        //       title: title,
        //       link: link,
        //     );
        //   },
        // ),
      ],
    ),
    transitionGoRoute(
      path: Routes.notification,
      name: Routes.notification,
      pageBuilder: (context, state) => NotificationViewPage(),
    ),
    transitionGoRoute(
      path: Routes.postCompanyNewJob,
      name: Routes.postCompanyNewJob,
      pageBuilder: (context, state) => const PostCompanyNewJobPage(),
      routes: [
        // transitionGoRoute(
        //   path: Routes.noticeDetailsPage,
        //   name: Routes.noticeDetailsPage,
        //   pageBuilder: (context, state) {
        //     final String slug = state.uri.queryParameters['slug']!;
        //     return NoticeDetailsPage(slug: slug);
        //   },
        // ),
      ],
    ),
    transitionGoRoute(
      path: Routes.companyJobAppliedCandidateProfile,
      name: Routes.companyJobAppliedCandidateProfile,
      pageBuilder: (context, state) {
        final String isSelectedCanditate =
            state.uri.queryParameters['isSelected'] ?? '';
        return CompanyJobAppliedCandidateProfile(
          isSelected: isSelectedCanditate,
        );
      },
    ),
    transitionGoRoute(
      path: Routes.companyAddEmployeePageMobile,
      name: Routes.companyAddEmployeePageMobile,
      pageBuilder: (context, state) => const CompanyAddEmployeePageMobile(),
    ),
    transitionGoRoute(
      path: Routes.companyEmployeeProfilePage,
      name: Routes.companyEmployeeProfilePage,
      pageBuilder: (context, state) => const CompanyEmployeeProfilePage(),
    ),
    transitionGoRoute(
      path: Routes.companyAssignedCourses,
      name: Routes.companyAssignedCourses,
      pageBuilder: (context, state) => const CompanyAssignedCourses(),
    ),
    transitionGoRoute(
      path: Routes.companyInvoicePage,
      name: Routes.companyInvoicePage,
      pageBuilder: (context, state) {
        final String title = state.uri.queryParameters['invoiceUrl']!;
        return CompanyInvoiceViewPage(invoiceUrl: title);
      },
    ),
    // transitionGoRoute(
    //   path: Routes.video,
    //   name: Routes.video,
    //   pageBuilder: (context, state) {
    //     final String videoLink = state.uri.queryParameters['videoLink']!;
    //     final String title = state.uri.queryParameters['title']!;
    //     final String description =
    //         state.uri.queryParameters['description'] ?? '';
    //     return LiveVideoPage(
    //       videoLink: videoLink,
    //       title: title,
    //       description: description,
    //     );
    //   },
    // ),
    // transitionGoRoute(
    //   path: Routes.webViewScreen,
    //   name: Routes.webViewScreen,
    //   pageBuilder: (context, state) {
    //     final String url = state.uri.queryParameters['url'] ?? '';
    //     final String title = state.uri.queryParameters['title'] ?? '';
    //     final String slug = state.uri.queryParameters['slug'] ?? '';
    //     return WebViewScreen(
    //       url: url,
    //       title: title,
    //       slug: slug,
    //     );
    //   },
    // ),
    transitionGoRoute(
      path: Routes.bottomNavBarInterview,
      name: Routes.bottomNavBarInterview,
      pageBuilder: (context, state) {
        return const BottomNavBarInterviewer();
      },
    ),
    transitionGoRoute(
      path: Routes.selecteInterviewFormConfirmation,
      name: Routes.selecteInterviewFormConfirmation,
      pageBuilder: (context, state) {
        return const SelectedInterviewDetailsPage();
      },
    ),
  ],
);

GoRoute transitionGoRoute({
  required String path,
  required String name,
  List<RouteBase>? routes,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder:
        (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 600),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          child: pageBuilder(context, state),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              textDirection: TextDirection.ltr,
              position: animation.drive(
                Tween(
                  begin: const Offset(1.5, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );
          },
        ),
    routes: routes ?? [],
  );
}
