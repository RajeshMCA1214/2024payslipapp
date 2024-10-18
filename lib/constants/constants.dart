import 'package:flutter/cupertino.dart';

import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class AppColor {
  static const Color primaryColor = Color(0xff002793);
  static const Color orangeColor = Color(0xffFF8269);
  static const Color greenColor = Color(0xff52BD70);
  static const Color borderColor = Color(0xffE3EBFF);
  static const Color violetColor = Color(0xff8157C6);
  static const Color hintColor = Color(0xff959CB1);
  static const Color dividerColor = Color(0xffD2D9E0);
  static const Color nameColor = Color(0xff0A183F);
  static const Color redColor = Color(0xffDD2702);
  static const Color imagebackground = Color(0xffEEF3FF);
  static const Color titleColor = Color(0xff0A183F);
  static const Color lightcardColor = Color(0xff1e398a);
  static const Color checkINColor = Color(0xff002c64);
}

class Images {
  static String get logoIcon => 'assets/images/icon.png';
  static String get splashIcon => 'assets/images/profilelogo.png';
  static String get bio => 'assets/images/bio.png';
  static String get prerigester_icon => 'assets/images/prerigester_icon.png';
  static String get preregisterfemal => 'assets/images/preregisterfemal.png';

  static String get home => 'assets/icons/home.svg';
  static String get homeActive => 'assets/icons/home_active.svg';
  static String get Totaluser => 'assets/icons/Total.svg';
  static String get absent => 'assets/icons/absent.svg';
  static String get card => 'assets/icons/card.svg';
  static String get cardActive => 'assets/icons/card_active.svg';
  static String get document => 'assets/icons/document.svg';
  static String get documentActive => 'assets/icons/document_active.svg';
  static String get menu => 'assets/icons/menu.svg';
  static String get menuActive => 'assets/icons/menu_active.svg';
  static String get user => 'assets/icons/user.svg';
  static String get userActive => 'assets/icons/user_active.svg';
  static String get menuCard => 'assets/icons/menu_card.svg';
  static String get menuSms => 'assets/icons/menu_sms.svg';
  static String get menuCall => 'assets/icons/menu_call.svg';
  static String get menuLocation => 'assets/icons/menu_location.svg';
  static String get menuKey => 'assets/icons/menu_key.svg';
  static String get menuEdit => 'assets/icons/menu_edit.svg';
  static String get menuLogout => 'assets/icons/menu_logout.svg';
  static String get checkIN => 'assets/icons/check_in.svg';
  static String get right => 'assets/icons/right.svg';
  static String get gallery => 'assets/icons/gallery.svg';
  static String get backArrow => 'assets/icons/back.svg';
  static String get search => 'assets/icons/search.svg';
  static String get delete => 'assets/icons/delete.svg';
  static String get login => 'assets/icons/login.svg';
  static String get logo => 'assets/icons/logo.svg';
  static String get listuser => 'assets/icons/user.png';
  static String get people => 'assets/icons/people.svg';
  static String get people2 => 'assets/icons/people_2.svg';
  static String get profile => 'assets/icons/profile.svg';
  static String get tick => 'assets/icons/tick.svg';
  static String get tick1 => 'assets/icons/tick1.svg';
  static String get cross => 'assets/icons/cross.svg';
  static String get cross1 => 'assets/icons/cross1.svg';
  static String get weekOff => 'assets/icons/week_off.svg';
  static String get tasca => 'assets/images/logo.png';
  static String get locationTick => 'assets/icons/location_tick.svg';

  static String get name => 'assets/icons/name.svg';
  static String get email => 'assets/icons/email.svg';
  static String get phone => 'assets/icons/phone.svg';
  static String get gender => 'assets/icons/gender.svg';
  static String get company => 'assets/icons/company.svg';
  static String get address => 'assets/icons/address.svg';
  static String get employee => 'assets/icons/employee.svg';
  static String get purpose => 'assets/icons/purpose.svg';
  static String get status => 'assets/icons/status.svg';
  static String get date => 'assets/icons/date.svg';
  static String get clock => 'assets/icons/clock.svg';
  static String get down => 'assets/icons/down.svg';
}

class ScreenSize {
  BuildContext context;
  ScreenSize(this.context);
  double get mainHeight => MediaQuery.of(context).size.height;
  double get mainWidth => MediaQuery.of(context).size.width;
  double get block => mainWidth / 100;
}
