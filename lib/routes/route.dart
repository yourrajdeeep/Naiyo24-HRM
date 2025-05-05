import 'package:get/get.dart';
import '../widgets/splash_screen.dart';
import '../widgets/role_selection_screen.dart';
import '../employee_interface/authentication/employee_signin_screen.dart';
import '../employee_interface/authentication/employee_signup_screen.dart';
import '../employee_interface/authentication/employee_forget_password_screen.dart';
import '../employee_interface/screens/employee_home_screen.dart';
import '../employee_interface/screens/employee_notice_screen.dart';
import '../employee_interface/screens/employee_attendance_record_screen.dart';
import '../employee_interface/screens/employee_daily_attendance_screen.dart';
import '../employee_interface/screens/employee_meetings_screen.dart';
import '../employee_interface/screens/employee_settings_screen.dart';
import '../employee_interface/screens/employee_account_screen.dart';
import '../applicant_interface/authentication/applicant_signin_screen.dart';
import '../applicant_interface/authentication/applicant_signup_screen.dart';
import '../applicant_interface/authentication/applicant_forget_password_screen.dart';
import '../applicant_interface/screens/applicant_home_screen.dart';
import '../applicant_interface/screens/applicant_account_screen.dart';
import '../applicant_interface/screens/applicant__update_account_screen.dart';
import '../applicant_interface/screens/applicant_notifications_screen.dart';
import '../applicant_interface/screens/applicant_settings_screen.dart';
import '../applicant_interface/screens/job_available_screen.dart';
import '../applicant_interface/screens/application_form_screen.dart';

class RouteClass {
  //Job Applicant Routes
  static const String splash = '/';
  static const String roleSelection = '/role-selection';
  static const String employeeSignIn = '/employee-signin';
  static const String employeeSignUp = '/employee-signup';
  static const String employeeForgetPassword = '/employee-forget-password';
  static const String employeeHome = '/employee-home';
  static const String employeeNotice = '/employee-notice';
  static const String employeeAttendanceRecord = '/employee-attendance-record';
  static const String employeeDailyAttendance = '/employee-daily-attendance';
  static const String employeeMeetings = '/employee-meetings';
  static const String employeeSettings = '/employee-settings';
  static const String employeeAccount = '/employee-account';
  static const String applicantSignIn = '/applicant-signin';
  static const String applicantSignUp = '/applicant-signup';
  static const String applicantForgetPassword = '/applicant-forget-password';
  static const String applicantHome = '/applicant-home';
  static const String applicantProfile = '/applicant-profile';
  static const String applicantApplications = '/applicant-applications';
  static const String applicantNotifications = '/applicant-notifications';
  static const String applicantSettings = '/applicant-settings';
  static const String applicantDepartmentJobs = '/applicant-department-jobs';

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: roleSelection,
      page: () => const RoleSelectionScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: employeeSignIn,
      page: () => const EmployeeSignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: employeeSignUp,
      page: () => const EmployeeSignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: employeeForgetPassword,
      page: () => const EmployeeForgetPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: employeeHome,
      page: () => const EmployeeHomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: employeeNotice,
      page: () => const EmployeeNoticeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: employeeAttendanceRecord,
      page: () => const EmployeeAttendanceRecordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: employeeDailyAttendance,
      page: () => const EmployeeDailyAttendanceScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: employeeMeetings,
      page: () => const EmployeeMeetingsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: employeeSettings,
      page: () => const EmployeeSettingsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: employeeAccount,
      page: () => const EmployeeAccountScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: applicantSignIn,
      page: () => const ApplicantSignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: applicantSignUp,
      page: () => const ApplicantSignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: applicantForgetPassword,
      page: () => const ApplicantForgetPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: applicantHome,
      page: () => const ApplicantHomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: applicantProfile,
      page: () => const ApplicantAccountScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: applicantSettings,
      page: () => const ApplicantSettingsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/applicant-update-profile',
      page: () => const ApplicantUpdateAccountScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: applicantNotifications,
      page: () => const ApplicantNotificationsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: applicantDepartmentJobs,
      page: () => const JobAvailableScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/applicant-apply-job',
      page: () => ApplicationFormScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
