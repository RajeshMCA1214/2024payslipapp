import 'package:get/get.dart';
import 'package:trilochanaa_app/views/pages/dashboard/employee_dashboard_page.dart';
import 'package:trilochanaa_app/views/pages/pre-register/absentee.dart';
import 'package:trilochanaa_app/views/pages/pre-register/pre_register_add_page.dart';
import 'package:trilochanaa_app/views/pages/pre-register/pre_register_edit_page.dart';
import 'package:trilochanaa_app/views/pages/pre-register/pre_register_visitor_details.dart';
import 'package:trilochanaa_app/views/pages/profile.dart';
import 'package:trilochanaa_app/views/pages/visitor/visitor.dart';
import 'package:trilochanaa_app/views/widget/bottom_nav.dart';

import '../SplashScreen/splash_screen.dart';
import '../views/pages/attendance/attendance_page.dart';
import '../views/pages/login.dart';

abstract class Routes {
  static final pages = [
    GetPage(name: "/", page: () => SplashScreen()),
    GetPage(name: "/login", page: () => LoginPage()),
    GetPage(name: "/BottomNav", page: () => BottomNav()),
    GetPage(name: "/AdminDashboardPage", page: () => EmployeeDashboardPage()),
    GetPage(name: "/visitor", page: () => VisitorListPage()),
 //   GetPage(name: "/pre-register", page: () => PreRegisterListPage()),
    GetPage(name: "/attendance", page: () => AttendancePage()),
    GetPage(name: "/profile", page: () => ProfilePage()),
    GetPage(
        name: "/pre-visitor-details", page: () => PreRegisterVisitorDetails()),
    GetPage(name: "/pre-register-edit", page: () => PreRegisterEditPage()),
    GetPage(name: "/pre-register-add", page: () => PreRegisterAddPage()),
  ];
}
