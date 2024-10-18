import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../AddedComponant/color_data.dart';
import '../../../AddedComponant/constant.dart';
import '../../../AddedComponant/fetch_pixels.dart';
import '../../../AddedComponant/pref_data.dart';
import '../../../AddedComponant/widget_utils.dart';
import '../../../Models/Presentee_Model.dart';
import '../../../Services/api-list.dart';

import 'package:http/http.dart' as http;

class PresenteeLists extends StatefulWidget {
  PresenteeLists({Key? key}) : super(key: key);

  @override
  State<PresenteeLists> createState() => _PresenteeListsPresenteeState();
}

class _PresenteeListsPresenteeState extends State<PresenteeLists> {
  List<Presentee> presentee = [];
  List<Presentee> filteredPresentee = [];
  TextEditingController searchController = TextEditingController();

  String? companyID;
  String? customerNAME;
  String? customerID;
  String? companyname;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  var _isLoading = false;

  get_sessionData() async {
    SharedPreferences complist = await SharedPreferences.getInstance();
    setState(() {
      companyname = complist.getString('companyName');
      companyID = complist.getString('companyId');
      customerNAME = complist.getString('customername');
      customerID = complist.getString('customerid');
      getData();
    });
  }

  Future<void> getData() async {
    print("No_ Imagesssss..................");

    try {
      print("welcome try block");

      print(companyID);
      print(customerID);
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

  @override
  void initState() {
    get_sessionData();
    super.initState();
    PresenteeLists();
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    double horSpace = FetchPixels.getDefaultHorSpace(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Presentee',
          style: TextStyle(
            color: blueColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true, // Aligns the title at the center
        elevation:
            0, // Set the elevation to 0 to remove the shadow and adjust the height
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    filteredPresentee = presentee
                        .where((presentee) => presentee.empCode!
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  } else {
                    filteredPresentee =
                        []; // Clear filtered list if search query is empty
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Search by Employee Code (ABC-0000)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.search,
                  color: blueColor,
                ), // Add a search icon
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: filteredPresentee.isEmpty
                  ? completeGoodsList()
                  : filteredPresentee.map((model) {
                      return fAll(
                        model,
                        context,
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
                          setState(() {
                            presentee.remove(model);
                          });
                        },
                      );
                    }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPresenteeList() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return completeGoodsList()[index];
            },
            childCount: filteredPresentee.length,
          ),
        ),
      ],
    );
  }

  List<Widget> completeGoodsList() {
    return presentee.map((model) {
      return fAll(model, context, presentee.indexOf(model), () {
        Presentee booking = Presentee(
          slno: model.slno,
          empCode: model.empCode,
          empName: model.empName,
          designation: model.designation,
          timeIn: model.timeIn,
        );
        PrefData.setBookingModel(jsonEncode(booking));
      }, () {
        setState(() {
          presentee.remove(model);
        });
      });
    }).toList();
  }

  GestureDetector fAll(Presentee model, BuildContext context, int index,
      Function function, Function funDelete) {
    // print(model.productImage);
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: FetchPixels.getPixelHeight(200),
        margin: EdgeInsets.only(
            bottom: FetchPixels.getPixelHeight(20),
            left: FetchPixels.getpresentCard(context),
            right: FetchPixels.getpresentCard(context)),
        padding: EdgeInsets.symmetric(
            vertical: FetchPixels.getPixelHeight(16),
            horizontal: FetchPixels.getPixelWidth(16)),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0.0, 4.0)),
            ],
            borderRadius:
                BorderRadius.circular(FetchPixels.getPixelHeight(12))),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/guard.png",
                    height: 70,
                    width: 70,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: getHorSpace(0),
                        ),
                        Row(
                          children: [
                            // getCustomFont("Emp Code : ", 18, textColor, 1,
                            //     fontWeight: FontWeight.w900),
                            getCustomFont(model.empCode ?? "", 18, blueColor, 1,
                                fontWeight: FontWeight.w800),
                          ],
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(6)),
                        Row(
                          children: [
                            // getCustomFont("Name : ", 18, textColor, 1,
                            //     fontWeight: FontWeight.w900),
                            getCustomFont(
                                model.empName ?? "", 18, Colors.black, 1,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(6)),
                        Row(
                          children: [
                            // getCustomFont("Designation : ", 18, textColor, 1,
                            //     fontWeight: FontWeight.w900),
                            getCustomFont(
                                model.designation ?? "", 18, Colors.black, 1,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                        /* Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                 "Total Hr: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14
                                  ),
                                ),
                                Text(
                                  model.workedHrs.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14
                                  ),
                                )
                              ],
                            )
                          ],
                        ),*/
                        Divider(
                          color: Colors.black26,
                        ),
                        Row(
                          children: [
                            getCustomFont(
                                "Check IN : ", 18, Colors.green.shade200, 1,
                                fontWeight: FontWeight.w900),
                            getCustomFont(
                                model.timeIn.toString(), 18, Colors.black, 1,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                        Row(
                          children: [
                            getCustomFont(
                                "Check Out: ", 18, Colors.red.shade200, 1,
                                fontWeight: FontWeight.w900),
                            getCustomFont(
                                model.timeOut.toString(), 18, Colors.black, 1,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: getHorSpace(0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
