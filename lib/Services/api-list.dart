class APIList {
  static String? server = "https://demo.quickpass.xyz/api/v1/";
  static String? server1 = "http://192.168.1.101/trilochanaa/app-api/";
  static String? apiUrl = "demo.quickpass.xyz";
  static String? apiUrl1 = "http://192.168.1.101/trilochanaa/app-api/";
  static String? apiEndPoint = "/api/v1/";



  static String? login = "${server1!}login_api.php";
  static String? company = "${server1!}companylist.php";
  static String? employeecount = "${server1!}employee_TotalCount.php";
  static String? customer = "${server1!}customerlist.php";
  static String? checkIN = "${server1!}AttendanceCheckIn.php";
  static String? presentees = "${server1!}presenteeList.php";
  static String? countPresent = "${server1!}Present_TotalCount.php";
  static String? shiftSelect = "${server1!}get_Shift_API.php";
  static String? checkOut = "${server1!}AttendanceCheckOutTest.php";
  static String? changepassword = "${server1!}Change_password.php";




//  static String? login = "${apiUrl1!}login";
  static String? logout = "${server!}logout";
  static String? refreshToken = "${server!}refresh-token";
  static String? device = "${server!}device";
  static String? fcmSubscribe = "${server!}fcm-subscribe";
  static String? fcmUnSubscribe = "${server!}fcm-unsubscribe";
  static String? profile = "${server1!}me";
 // static String? profile = "${server!}me";
  static String? profileUpdate = "${server!}profile-update";
  static String? changePassword = "${server!}change-password";
  static String? dashboard = "${server!}dashboard";
  static String? visitorList = "${server!}visitors";
  static String? visitorSearchList = "${server!}visitors/search/";
  static String? visitorDetails = "${server!}visitors/show/";
  static String? changeStatus = "${server!}visitor/change-status/";
 // static String? checkOut = "${server!}visitor/check-out/";
  static String? attendanceStatus = "${server!}attendance/user/status";
  static String? attendanceClockin = "${server!}attendance/user/clock-in";
  static String? attendanceClockout = "${server!}attendance/user/clock-out";
  static String? preRegisterList = "${server!}preregister";
  static String? preRegisterSearch = "${server!}preregister/search/";
  static String? preVisitorDetails = "${server!}preregister/";
  static String? preRegUpdate = "${server!}preregister/";
  static String? preRegisterDelete = "${server!}preregister/";
}
