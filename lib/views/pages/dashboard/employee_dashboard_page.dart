// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilochanaa_app/constants/constants.dart';
import 'package:trilochanaa_app/views/pages/visitor/visitor.dart';
import 'package:trilochanaa_app/views/widget/dashboard_card.dart';

import '../../../AddedComponant/color_data.dart';
import '../../../AddedComponant/fetch_pixels.dart';
import '../../../AddedComponant/pref_data.dart';
import '../../../AddedComponant/widget_utils.dart';
import '../../../Controllers/dashboard_controller.dart';
import '../../../Controllers/visitor-controller.dart';
import '../../../Models/Presentee_Model.dart';
import '../../../Models/employeecount_model.dart';
import '../../../Models/presentCountModel.dart';
import '../../../Services/api-list.dart';
import '../../shimmer/visitor-shimmer.dart';
import '../../widget/precent_card.dart';
import '../../widget/second_Dashboard_card.dart';
import '../../widget/visitor_card.dart';
import 'package:http/http.dart' as http;

class EmployeeDashboardPage extends StatefulWidget {
  const EmployeeDashboardPage({Key? key}) : super(key: key);

  @override
  State<EmployeeDashboardPage> createState() => _EmployeeDashboardPageState();
}

class _EmployeeDashboardPageState extends State<EmployeeDashboardPage> {
  DashboardController dashboardController = Get.put(DashboardController());
  List<Presentee> presentee = [];

  List<Present> present = [];
  var _isLoading = false;

  Future<void> _onRefresh() {
    dashboardController.onInit();
    Get.find<VisitorController>().onInit();
    Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });

    return completer.future;
  }

  get_sessionData() async {
    SharedPreferences complist = await SharedPreferences.getInstance();
    setState(() {
      companyname = complist.getString('companyName');
      companyID = complist.getString('companyId');
      customerNAME = complist.getString('customername');
      customerID = complist.getString('customerid').toString();
      getData();
    });
    print("this is coustomer Id: $customerID ");
    print("company Name: $companyname ");
  }

  Future<void> getData() async {
    print("No_ Imagesssss..................");

    try {
      print("welcome try block");

      final response = await http.post(
        Uri.parse(APIList.presentees!),
        headers: {"Accept": "application/json"},
        body: {"company_id": companyID, "customer_id": customerID},
      );

      if (response.statusCode == 200) {
        print('imn');
        print(response.body);
        print('hello');

        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('hiiii');

        if (responseData.containsKey('presentee')) {
          final List<dynamic> present = responseData['presentee'];

          if (present.isNotEmpty) {
            setState(() {
              presentee =
                  present.map((data) => Presentee.fromJson(data)).toList();
              print("imajklp;ge");

              _isLoading = true;
            });
          } else {
            print("presentee is empty. Response data structure: $responseData");
          }
        } else {
          print(
              "presentee key not found in response. Response data structure: $responseData");
        }
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      print("$e");
    }
  }

  String selectedValue = '';

  String name = '';
  String company = '';
  String? companyID;
  String? customerNAME;
  String? customerID;
  String? companyname;
  String employeCount = '';
  String presentcount = '';
  String empname = '';

  List<Data> data = [];

  @override
  void initState() {
    super.initState(); // Call super.initState() first

    initializeData();
  }

  Future<void> initializeData() async {
    await get_sessionData(); // Wait for session data to be retrieved

    await getNameFromPrefs(); // Wait for name to be retrieved from preferences

    company = await getcompany() ?? ''; // Wait for the company name to be retrieved
    print("company: $company");

    // Call all the functions that depend on the company data being available
    getData();
    presentcountData();
    employeeCount();
  }

  Future<void> employeeCount() async {
    print("welcome try block outer");
    print(employeCount);

    try {
      print(companyID);

      final response = await http.post(
        Uri.parse(APIList.employeecount!),
        headers: {"Accept": "application/json"},
        body: {
          "companyID": companyID,
        },
      );

      if (response.statusCode == 200) {
        print('hello');
        print(response.body);
        var responseData = jsonDecode(response.body);

        print(responseData['total_count']);

        if (responseData.containsKey('status') &&
            responseData['status'] == 'Success') {
          // If the response contains totalCount and other necessary fields, you can parse it into empCount model
          empCount? count = empCount.fromJson(responseData);

          if (count != null && count.totalCount != null) {
            setState(() {
              employeCount = count.totalCount!;
            });

            print("Employee Count: $employeCount");
          } else {
            print("Total count not found in response");
          }
        } else {
          print("API call failed. Response data: $responseData");
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error getting detail: $error');
    }
  }
  Future<void> presentcountData() async {
    print("welcome try block outer");
    print(employeCount);

    try {
      print(companyID);

      final response = await http.post(
        Uri.parse(APIList.countPresent!),
        headers: {"Accept": "application/json"},
        body: {
          "company_id": companyID,
          "customer_id": customerID,
        },
      );

      if (response.statusCode == 200) {
        print('hello');
        print(response.body);
        var responseData = jsonDecode(response.body);

        print(responseData['total_count']);

        if (responseData.containsKey('status') &&
            responseData['status'] == 'Success') {
          // If the response contains totalCount and other necessary fields, you can parse it into empCount model
          presentCount? count = presentCount.fromJson(responseData);

          if (count != null && count.totalCount != null) {
            setState(() {
              presentcount = count.totalCount!;
            });

            print("Employee Count: $presentcount");
          } else {
            print("Total count not found in response");
          }
        } else {
          print("API call failed. Response data: $responseData");
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error getting detail: $error');
    }
  }
  Future<String?> getNameFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    setState(() {
      this.name = name ?? '';
      selectedValue = "Welcome $name";
    });
    print('Name from SharedPreferences: $name');
    return name;
  }
  Future<String?> getcompany() async {
    SharedPreferences complist = await SharedPreferences.getInstance();
    setState(() {
      companyname = complist.getString('companyName');
      companyID = complist.getString('companyId');
      customerNAME = complist.getString('customerName');
      customerID = complist.getString('customerId');
    });

    // print(
    //     "Retrieved company name: $companyname"); // Print the retrieved company name
    print(
        "Retrieved company ID: $companyID"); // Print the retrieved company name
    // Return the retrieved company name
  }

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _onRefresh();
    });
    if (box.read('selectedValue') != null) {
      selectedValue = box.read('selectedValue');
    }
    return Scaffold(
      body: GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (dashboard) => RefreshIndicator(
          onRefresh: _onRefresh,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: ListView(
              children: [
                // Dashboard section
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Images.logo,
                        height: 24,
                        width: 80,
                        // color: AppColor.primaryColor,
                      ),
                      Row(
                        children: [
                          Text(selectedValue.toString()),
                          SizedBox(width: 10),
                          // _languagePopupButton()
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DashboardCard(
                          page: false,
                          //  topic: '$customerNAME'.tr,
                          countTotal: '$employeCount'.toString(),
                          imgUrlTotal: Images.Totaluser,
                          countPre: '$presentcount'.toString(),
                          // tittle: dashboard.totalPreRegister.toString(),
                          // imgUrlPre: Images.absent,
                          // imgUrlweek: Images.weekOff,
                          // weekoff: dashboard.totalabsent.toString(),
                          cardColor: AppColor.lightcardColor,
                          topic: '',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SecondDashboardCard(
                          page: false,
                        //  topic: '$customerNAME'.tr,
                          // countTotal: '$employeCount'.toString(),
                          // imgUrlTotal: Images.Totaluser,
                          countPre: '$presentcount'.toString(),
                          // tittle: dashboard.totalPreRegister.toString(),
                          imgUrlPre: Images.absent,
                          imgUrlweek: Images.weekOff,
                          weekoff: dashboard.totalabsent.toString(),
                          cardColor: AppColor.lightcardColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                          '$customerNAME',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today Presents'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff002793),
                          fontSize: 20,
                        ),
                      ),

                      /*  TextButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print('view all visitors ------->>>');
                          }
                          Get.to(VisitorListPage());
                        },
                        child: Text(
                          'view_all'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColor.primaryColor,
                            fontSize: 12,
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),

                // Call completeGoodsList method here
                ...completeGoodsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> completeGoodsList() {
    // Take the first 3 items from the presentee list
    List<Presentee> firstThreeItems = presentee.take(2).toList();

    return firstThreeItems.map((model) {
      return fAll(
        model,
        presentee.indexOf(model),
        () {
          Presentee booking = Presentee(
            slno: model.slno,
            empCode: model.empCode,
            empName: model.empName,
            designation: model.designation,
            timeIn: model.timeIn,
          );
          PrefData.setBookingModel(jsonEncode(booking));
        },
        () {
          presentee.remove(model);
        },
      );
    }).toList();
  }

  GestureDetector fAll(
    Presentee model,
    int index,
    Function function,
    Function funDelete,
  ) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: FetchPixels.getPixelHeight(170),
        margin: EdgeInsets.only(
          bottom: FetchPixels.getPixelHeight(20),
          left: FetchPixels.getPixelHeight(2),
          right: FetchPixels.getPixelHeight(2),
        ),
        padding: EdgeInsets.symmetric(
          vertical: FetchPixels.getPixelHeight(20),
          horizontal: FetchPixels.getPixelWidth(20),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0.0, 4.0),
            ),
          ],
          borderRadius: BorderRadius.circular(
            FetchPixels.getPixelHeight(12),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/guard.png",
                    height: 60,
                    width: 55,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Row(
                          children: [
                            // getCustomFont(
                            //   "Emp Code : ",
                            //   18,
                            //   textColor,
                            //   1,
                            //   fontWeight: FontWeight.w900,
                            // ),
                            getCustomFont(
                              model.empCode ?? "",
                              18,
                              blueColor,
                              1,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(6)),
                        Row(
                          children: [
                            // getCustomFont(
                            //   "Name : ",
                            //   18,
                            //   textColor,
                            //   1,
                            //   fontWeight: FontWeight.w900,
                            // ),
                            getCustomFont(
                              model.empName ?? "",
                              17,
                              Colors.black,
                              1,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(6)),
                        Row(
                          children: [
                            // getCustomFont(
                            //   "D-nation : ",
                            //   18,
                            //   textColor,
                            //   1,
                            //   fontWeight: FontWeight.w900,
                            // ),
                            getCustomFont(
                              model.designation ?? "",
                              16,
                              Colors.black,
                              1,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(6)),
                        Divider(
                          color: Colors.black26,
                        ),
                        Row(
                          children: [

                            getCustomFont(
                              "Check In : ",
                              16,
                              Colors.green,
                              1,
                              fontWeight: FontWeight.w900,
                            ),
                            getCustomFont(
                              model.timeIn.toString(),
                              16,
                              Colors.black,
                              1,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          funDelete();
                        },
                        child: getSvgImage(
                          "",
                          width: FetchPixels.getPixelHeight(20),
                          height: FetchPixels.getPixelHeight(20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _languagePopupButton() {
    return PopupMenuButton(
      child: Container(
        height: 28,
        width: 28,
        child: CircleAvatar(
          child: Flag.fromString(
            box.read("langKey") == null ? 'us' : box.read("langKey"),
            height: 30,
            width: 30,
            fit: BoxFit.cover,
            borderRadius: 50,
          ),
        ),
      ),
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext bc) => [
        PopupMenuItem(
          value: "en",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Flag.fromCode(
                    FlagsCode.US,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 5.0),
                  Text("English", style: const TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: "bn",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Flag.fromCode(
                    FlagsCode.BD,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 5.0),
                  Text("Bangla", style: const TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: "de",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Flag.fromCode(
                    FlagsCode.DE,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 5.0),
                  Text("German", style: const TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: "fr",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Flag.fromCode(
                    FlagsCode.FR,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 5.0),
                  Text("France", style: const TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: "ar",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Flag.fromCode(
                    FlagsCode.SA,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 5.0),
                  Text("Arabic", style: const TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == "en") {
          setState(() {
            box.write('lang', value);
            box.write('langKey', 'US');
            box.write('selectedValue', 'English');
            Get.updateLocale(const Locale('en', 'US'));
          });
        } else if (value == "bn") {
          setState(() {
            box.write('lang', value);
            box.write('langKey', 'BD');
            box.write('selectedValue', 'Bangla');
            Get.updateLocale(const Locale('bn', 'BD'));
          });
        } else if (value == "de") {
          setState(() {
            box.write('lang', value);
            box.write('langKey', 'DE');
            box.write('selectedValue', 'German');
            Get.updateLocale(const Locale('de', 'DE'));
          });
        } else if (value == "fr") {
          setState(() {
            box.write('lang', value);
            box.write('langKey', 'FR');
            box.write('selectedValue', 'France');
            Get.updateLocale(const Locale('fr', 'FR'));
          });
        } else if (value == "ar") {
          setState(() {
            box.write('lang', value);
            box.write('langKey', 'SA');
            box.write('selectedValue', 'Arabic');
            Get.updateLocale(const Locale('ar', 'AR'));
          });
        }
      },
    );
  }

  Widget nullListView(BuildContext context) {
    return getPaddingWidget(
        EdgeInsets.symmetric(horizontal: FetchPixels.getnullList(context)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // getSvgImage("no-connection.png",
            //     height: FetchPixels.getPixelHeight(24),
            //     width: FetchPixels.getPixelHeight(24)),
            getVerSpace(FetchPixels.getPixelHeight(40)),
            getCustomFont("No Records Yet!", 35, Colors.black, 1,
                fontWeight: FontWeight.w900),
            getVerSpace(FetchPixels.getPixelHeight(10)),
          ],
        ));
  }
}
