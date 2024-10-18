import 'package:get/get_state_manager/get_state_manager.dart';

import 'dart:convert';
import 'package:get/get.dart';
import 'package:trilochanaa_app/Models/pre_register_model.dart';
import '../Services/api-list.dart';
import '../services/server.dart';

class PreRegisterController extends GetxController {
  Server server = Server();
  bool loader = false;
  List<Preregisters> preVisitorList = <Preregisters>[];
  List<Preregisters> preVisitorSearchList = <Preregisters>[];

  @override
  void onInit() {
    super.onInit();
    getPreVisitors();
  }

  getPreVisitors() async {
    loader = true;
    update();
    preVisitorList = <Preregisters>[];

    server.getRequest(endPoint: APIList.preRegisterList).then((response) {
      if (response != null && response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var preVisitorListData = PreRegisterModel.fromJson(jsonResponse);
        preVisitorList = <Preregisters>[];
        preVisitorList.addAll(preVisitorListData.data!.preregisters!);
        loader = false;
        update();
      } else {
        loader = false;
        update();
        return null;
      }
    });
  }

  getSearchedPreVisitors(name) async {
    if (name.toString().isEmpty) {
      getPreVisitors();
    } else {
      loader = true;
      update();
      server
          .getRequest(endPoint: (APIList.preRegisterSearch! + "$name"))
          .then((response) {
        if (response != null && response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          var preVisitorSearchListData =
              PreRegisterModel.fromJson(jsonResponse);
          preVisitorList = <Preregisters>[];
          preVisitorList.addAll(preVisitorSearchListData.data!.preregisters!);
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
}
