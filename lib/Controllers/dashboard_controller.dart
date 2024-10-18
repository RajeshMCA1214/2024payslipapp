import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../Models/dashboard_model.dart';
import '../Services/api-list.dart';
import '../services/server.dart';

class DashboardController extends GetxController {
  Server server = Server();
  bool loader = true;
  List<DashboardVisitor> visitorList = <DashboardVisitor>[];
  String totalVisitor = '0';
  String totalPreRegister = '0';
  String totalabsent = '0';

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }

  getDashboard() async {
    loader = true;
    update();
    visitorList = <DashboardVisitor>[];
      server.getRequest(endPoint: APIList.dashboard).then((response) {
        print( jsonDecode(response.body));
      if (response != null && response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var dashboardData = DashboardModel.fromJson(jsonResponse);
        visitorList = <DashboardVisitor>[];
        visitorList.addAll(dashboardData.data!.visitor!);
        totalVisitor = dashboardData.data!.totalVisitors.toString();
        totalPreRegister = dashboardData.data!.totalPreRegisters.toString();

        loader = false;
        update();
      } else {
        loader = false;
        update();
        return null;
      }
    });
  }
}
