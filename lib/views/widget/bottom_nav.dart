import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trilochanaa_app/constants/constants.dart';
import 'package:trilochanaa_app/views/pages/attendance/attendance_page_imn.dart';
import 'package:trilochanaa_app/views/pages/dashboard/employee_dashboard_page.dart';
import 'package:trilochanaa_app/views/pages/pre-register/absentee.dart';
import 'package:trilochanaa_app/views/pages/visitor/visitor.dart';
import '../pages/attendance/attendance_page.dart';
import '../pages/profile.dart';
import '../pages/visitor/presenteeList.dart';

// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key);

  final List navigation = [
    EmployeeDashboardPage(),
    PresenteeLists(),
    //PreRegisterListPage(),
    // AttendancePage(),
    AttendancePageImn(),
    ProfilePage(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _onTap(int index) {
      selectedIndex = index;
      (context as Element).markNeedsBuild();
    }

    return Scaffold(
      body: navigation[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 24,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Images.home,
                height: 24,
                width: 24,
              ),
              activeIcon: SvgPicture.asset(
                Images.homeActive,
                height: 24,
                width: 24,
              ),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Images.card,
                height: 24,
                width: 24,
              ),
              activeIcon: SvgPicture.asset(
                Images.cardActive,
                height: 24,
                width: 24,
              ),
              label: 'visitor'),
          // BottomNavigationBarItem(
          //     icon: SvgPicture.asset(
          //       Images.document,
          //       height: 24,
          //       width: 24,
          //     ),
          //     activeIcon: SvgPicture.asset(
          //       Images.documentActive,
          //       height: 24,
          //       width: 24,
          //     ),
          //     label: 'pre-register'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Images.menu,
                height: 24,
                width: 24,
              ),
              activeIcon: SvgPicture.asset(
                Images.menuActive,
                height: 24,
                width: 24,
              ),
              label: 'attendance_page'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Images.user,
                height: 24,
                width: 24,
              ),
              activeIcon: SvgPicture.asset(
                Images.userActive,
                height: 24,
                width: 24,
              ),
              label: 'profile'),
        ],
      ),
    );
  }
}
