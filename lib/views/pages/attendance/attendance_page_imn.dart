import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'check_In_scan_page.dart';
import '../../../AddedComponant/color_data.dart';
import '../../../Services/api-list.dart';
import 'check_Out_scan_page.dart';

class AttendancePageImn extends StatefulWidget {
  const AttendancePageImn({Key? key}) : super(key: key);

  @override
  State<AttendancePageImn> createState() => _AttendancePageImnState();
}

class _AttendancePageImnState extends State<AttendancePageImn> {
  final TextEditingController clockInController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ShiftSelection? selectedWarehouse;
  String selectedWarehouseId = '';
  String selectedShiftName = '';
  String? customerID;
  String? selectedItem;
  List<ShiftSelection> warehouseList = [];
  List<String> data=["Security Guard","Security Officer","Assistant Security Officer","Inspector","Lady Security Guard "];

  void saveSessionData(String itemss) async {
    SharedPreferences complist = await SharedPreferences.getInstance();
    await complist.setString('ShiftName', selectedShiftName);
    await complist.setString('destination', selectedItem ?? '');
  //  await complist.setString('companyId', companyId);

    print("Selected shift saved to session: $selectedShiftName");
    print("Selected destination saved to session: $selectedItem");
   // print("Selected company ID saved to session: $companyId");
  }
  get_sessionData() async {
    SharedPreferences complist = await SharedPreferences.getInstance();
    setState(() {

      customerID = complist.getString('customerid').toString();
      print(customerID);
    });
    fetchWarehouse();
  }


  Future<void> fetchWarehouse() async {
    print("id Matched");
    try {
      final response = await http.post(Uri.parse(APIList.shiftSelect!),
          headers: {"Accept": "application/json"},
      body:{
        "customer_ID": customerID.toString(),
          }
      );

      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data.containsKey('ShiftList') && data['ShiftList'] is List<dynamic>) {
          var warehouseData = data['ShiftList'] as List<dynamic>;

          print('Parsed warehouse data: $warehouseData');

          setState(() {
            warehouseList = warehouseData
                .map<ShiftSelection>((warehouse) => ShiftSelection.fromJson(warehouse))
                .toList();
          });

          print('Updated warehouse list: $warehouseList');
        } else {
          print('Shift data not available or not in the correct format');
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error selecting your company: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    get_sessionData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Attendance',
          style: TextStyle(
            color: blueColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.0,right: 14.0),
              child:  DropdownButtonFormField<ShiftSelection>(
                value: selectedWarehouse,
                onChanged: (ShiftSelection? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedWarehouse = newValue;
                      // selectedWarehouseId = newValue.id!;

                      selectedShiftName = newValue.shiftType!;
                    });
                    saveSessionData(selectedShiftName);
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white60,
                ),
                items: [
                  DropdownMenuItem(
                    value: null,
                    child: Text(
                      "---Select Your Shift---",
                      style: TextStyle(
                          color: blueColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  ...warehouseList.map((warehouse) {
                    return DropdownMenuItem<ShiftSelection>(
                      value: warehouse,
                      child: Row(
                        children: [
                          Icon(
                            warehouse == selectedWarehouse
                                ? Icons.done_all_rounded
                                : Icons.filter_tilt_shift_rounded,
                            color: blueColor,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            warehouse.shiftType!,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

          Padding(
            padding: EdgeInsets.only(left: 14.0,right: 14.0),
           child:  DropdownButtonFormField<String>(
              value: selectedItem, // Use correct variable name
              onChanged: (newValue) {
                setState(() {
                  selectedItem = newValue; // Use correct variable name
                  saveSessionData(newValue ?? '');
                });
              },
              items: data.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: '--Select your Designation--',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an item';
                }
                return null;
              },
            ),
          ),


            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AttendanceScanPage()));
                print('Check In pressed');
              },
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/checks-in.png',
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Check In',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => checkOut()));
                print('Check Out pressed');
              },
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/checks-out.png',
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Check Out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShiftSelection {
  String? shiftType;
  String? id;

  ShiftSelection({this.shiftType, this.id});

  factory ShiftSelection.fromJson(Map<String, dynamic> json) {
    return ShiftSelection(
      shiftType: json['shift_type'],
      id: json['id'],
    );
  }
}
// main old so don't delete this
// body: GestureDetector(
//     onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//     child: GetBuilder<AttendanceController>(
//       init: AttendanceController(),
//       builder: (attendance) => attendance.commonLoader
//           ? const AttendanceShimmer()
//           : SingleChildScrollView(
//               physics: const NeverScrollableScrollPhysics(),
//               child: Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(top: 5),
//                     child: Padding(
//                       padding:
//                           const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           /*Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'good_morning'.tr,
//                                 style: const TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColor.primaryColor,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 attendance.profileUser.name.toString(),
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColor.primaryColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                               width: 50,
//                               height: 50,
//                               child: CachedNetworkImage(
//                                   imageUrl: attendance.profileUser.image
//                                       .toString(),
//                                   imageBuilder: (context,
//                                           imageProvider) =>
//                                       CircleAvatar(
//                                         radius: 40.0,
//                                         backgroundColor:
//                                             Colors.transparent,
//                                         backgroundImage: imageProvider,
//                                       ),
//                                   placeholder: (context, url) =>
//                                       Shimmer.fromColors(
//                                         child: const CircleAvatar(
//                                             radius: 40.0),
//                                         baseColor: Colors.grey[300]!,
//                                         highlightColor: Colors.grey[400]!,
//                                       ),
//                                   errorWidget: (context, url, error) =>
//                                       CircleAvatar(
//                                         child: Image.asset(
//                                           'assets/images/visitor.png',
//                                           width: 100,
//                                           height: 100,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ))),
//                         ],
//                       ),*/
//                           // const SizedBox(
//                           //   height: 45,
//                           // ),
//                           Text(
//                             attendance.currentTime.toString(),
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                               color: AppColor.primaryColor,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             attendance.currentDate.toString(),
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                               color: AppColor.hintColor,
//                             ),
//                           ),
//                           // const SizedBox(height: 20),
//                           /*SizedBox(
//                         width: 190,
//                         // height: 48,
//                         child: attendance.showClockin
//                             ? Form(
//                                 key: _formKey,
//                                 child: TextFormField(
//                                   controller: clockInController,
//                                   textInputAction: TextInputAction.done,
//                                   keyboardType: TextInputType.text,
//                                   cursorColor: AppColor.primaryColor,
//                                   validator: (value) => value!.isEmpty
//                                       ? 'field_cant_be_empty'.tr
//                                       : null,
//                                   decoration: InputDecoration(
//                                     contentPadding:
//                                         const EdgeInsets.symmetric(
//                                             vertical: 10.0,
//                                             horizontal: 10.0),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(5.0),
//                                       borderSide: const BorderSide(
//                                         width: 1,
//                                         color: AppColor.redColor,
//                                       ),
//                                     ),
//                                     focusedErrorBorder:
//                                         OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(5.0),
//                                       borderSide: const BorderSide(
//                                         width: 1,
//                                         color: AppColor.redColor,
//                                       ),
//                                     ),
//                                     hintText: 'work_from'.tr,
//                                     hintStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16,
//                                       color: AppColor.hintColor,
//                                     ),
//                                     fillColor: Colors.red,
//                                     focusedBorder:
//                                         const OutlineInputBorder(
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(5),
//                                           bottomLeft: Radius.circular(5)),
//                                       borderSide: BorderSide(
//                                           width: 1,
//                                           color: AppColor.primaryColor),
//                                     ),
//                                     enabledBorder:
//                                         const OutlineInputBorder(
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(5),
//                                         bottomLeft: Radius.circular(5),
//                                         topRight: Radius.circular(5),
//                                         bottomRight: Radius.circular(5),
//                                       ),
//                                       borderSide: BorderSide(
//                                           width: 1,
//                                           color: AppColor.borderColor),
//                                     ),
//                                   ),
//                                   onFieldSubmitted: (value) {
//                                     //add code
//                                   },
//                                 ),
//                               )
//                             : Center(
//                                 child: Text(
//                                   'work_from'.tr +
//                                       ': ${attendance.workFrom}',
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     color: AppColor.primaryColor,
//                                   ),
//                                 ),
//                               ),
//                       ),*/
//                           // const SizedBox(height: 30),
//                           Container(
//                             // height: ScreenSize(context).mainHeight / 4.5,
//                             // width: ScreenSize(context).mainWidth / 2.2,
//                             height: 120,
//                             width: 120,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               boxShadow: <BoxShadow>[
//                                 BoxShadow(
//                                     color: attendance.clockOut == ''
//                                         ? attendance.showClockin
//                                             ? AppColor.primaryColor
//                                                 .withOpacity(0.7)
//                                             : AppColor.redColor
//                                                 .withOpacity(0.7)
//                                         : Colors.black.withOpacity(.7),
//                                     blurRadius: 15.0,
//                                     offset: const Offset(0.0, 0.75))
//                               ],
//                             ),
//                             child: attendance.clockOut == ''
//                                 ? attendance.showClockin
//                                     ? ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor:
//                                               // AppColor.primaryColor,
//                                               AppColor.checkINColor,
//                                           shape: const StadiumBorder(),
//                                         ),
//                                         onPressed: () {
//                                           // final FormState? form =
//                                           //     _formKey.currentState;
//                                           //scan page
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       AttendanceScanPage()));
//                                           // if (form!.validate()) {
//                                           //   attendance.clockInUpdate(context,
//                                           //       clockInController.text);
//                                           // }
//                                           clockInController.clear();
//                                           // (context as Element)
//                                           //     .markNeedsBuild();
//                                         },
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                               Images.checkIN,
//                                               height: 42,
//                                               width: 42,
//                                             ),
//                                             const SizedBox(
//                                               height: 10,
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   right:
//                                                       box.read('lang') ==
//                                                               'ar'
//                                                           ? 15
//                                                           : 0,
//                                                   bottom:
//                                                       box.read('lang') ==
//                                                               'ar'
//                                                           ? 5
//                                                           : 0),
//                                               child: Text(
//                                                 'Check In'.tr,
//                                                 style: const TextStyle(
//                                                   fontSize: 12,
//                                                   fontWeight:
//                                                       FontWeight.w700,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     : ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor:
//                                               AppColor.redColor,
//                                           shape: const StadiumBorder(),
//                                         ),
//                                         onPressed: () {
//                                          // showAlertDialog(context);
//                                         },
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                               Images.checkIN,
//                                               height: 42,
//                                               width: 42,
//                                               color: Colors.white,
//                                             ),
//                                             const SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text(
//                                               'clock_out'.tr,
//                                               style: const TextStyle(
//                                                 fontSize: 24,
//                                                 fontWeight:
//                                                     FontWeight.w700,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                 : ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.black,
//                                       shape: const StadiumBorder(),
//                                     ),
//                                     onPressed: () {},
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           'you_are_clocked_out'.tr,
//                                           textAlign: TextAlign.center,
//                                           style: const TextStyle(
//                                             fontSize: 24,
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                           ),
//                           const SizedBox(
//                             height: 50,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 30.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     /* Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'clock_in'.tr,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         color: AppColor.primaryColor,
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     attendance.showClockin
//                                         ? const Text(
//                                             'N/A',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               color:
//                                                   AppColor.primaryColor,
//                                               fontSize: 14,
//                                             ),
//                                           )
//                                         : Text(
//                                             attendance.clockIN,
//                                             style: const TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               color:
//                                                   AppColor.primaryColor,
//                                               fontSize: 14,
//                                             ),
//                                           ),
//                                   ],
//                                 ),
//                                 Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'clock_out'.tr,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         color: AppColor.primaryColor,
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     attendance.clockOut == ''
//                                         ? const Text(
//                                             'N/A',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               color:
//                                                   AppColor.primaryColor,
//                                               fontSize: 14,
//                                             ),
//                                           )
//                                         : Text(
//                                             attendance.clockOut
//                                                 .toString(),
//                                             style: const TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               color:
//                                                   AppColor.primaryColor,
//                                               fontSize: 14,
//                                             ),
//                                           ),
//                                   ],
//                                 )*/
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(top: 1),
//                     child: Padding(
//                       padding:
//                           const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//
//                           Text(
//                             attendance.currentTime.toString(),
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                               color: AppColor.primaryColor,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             attendance.currentDate.toString(),
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                               color: AppColor.hintColor,
//                             ),
//                           ),
//
//                           Container(
//                             // height: ScreenSize(context).mainHeight / 4.5,
//                             // width: ScreenSize(context).mainWidth / 2.2,
//                             height: 120,
//                             width: 120,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               boxShadow: <BoxShadow>[
//                                 BoxShadow(
//                                     color: attendance.clockOut == ''
//                                         ? attendance.showClockin
//                                             ? AppColor.primaryColor
//                                                 .withOpacity(0.7)
//                                             : AppColor.redColor
//                                                 .withOpacity(0.7)
//                                         : Colors.black.withOpacity(.7),
//                                     blurRadius: 15.0,
//                                     offset: const Offset(0.0, 0.75))
//                               ],
//                             ),
//                             child: attendance.clockOut == ''
//                                 ? attendance.showClockin
//                                     ? ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor:
//                                               // AppColor.primaryColor,
//                                               AppColor.checkINColor,
//                                           shape: const StadiumBorder(),
//                                         ),
//                                         onPressed: () {
//                                           // final FormState? form =
//                                           //     _formKey.currentState;
//                                           //scan page
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       checkOut()));
//                                           // if (form!.validate()) {
//                                           //   attendance.clockInUpdate(context,
//                                           //       clockInController.text);
//                                           // }
//                                           clockInController.clear();
//                                           // (context as Element)
//                                           //     .markNeedsBuild();
//                                         },
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                               Images.checkIN,
//                                               height: 42,
//                                               width: 42,
//                                             ),
//                                             const SizedBox(
//                                               height: 10,
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   right:
//                                                       box.read('lang') ==
//                                                               'ar'
//                                                           ? 15
//                                                           : 0,
//                                                   bottom:
//                                                       box.read('lang') ==
//                                                               'ar'
//                                                           ? 5
//                                                           : 0),
//                                               child: Text(
//                                                 'Check Out'.tr,
//                                                 style: const TextStyle(
//                                                   fontSize: 12,
//                                                   fontWeight:
//                                                       FontWeight.w700,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     : ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor:
//                                               AppColor.redColor,
//                                           shape: const StadiumBorder(),
//                                         ),
//                                         onPressed: () {
//                                           //showAlertDialog(context);
//                                         },
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                               Images.checkIN,
//                                               height: 42,
//                                               width: 42,
//                                               color: Colors.white,
//                                             ),
//                                             const SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text(
//                                               'clock_out'.tr,
//                                               style: const TextStyle(
//                                                 fontSize: 24,
//                                                 fontWeight:
//                                                     FontWeight.w700,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                 : ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.black,
//                                       shape: const StadiumBorder(),
//                                     ),
//                                     onPressed: () {},
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           'you_are_clocked_out'.tr,
//                                           textAlign: TextAlign.center,
//                                           style: const TextStyle(
//                                             fontSize: 24,
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                           ),
//                           const SizedBox(
//                             height: 50,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 30.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     /* Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'clock_in'.tr,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         color: AppColor.primaryColor,
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     attendance.showClockin
//                                         ? const Text(
//                                             'N/A',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               color:
//                                                   AppColor.primaryColor,
//                                               fontSize: 14,
//                                             ),
//                                           )
//                                         : Text(
//                                             attendance.clockIN,
//                                             style: const TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               color:
//                                                   AppColor.primaryColor,
//                                               fontSize: 14,
//                                             ),
//                                           ),
//                                   ],
//                                 ),
//                                 Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'clock_out'.tr,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         color: AppColor.primaryColor,
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     attendance.clockOut == ''
//                                         ? const Text(
//                                             'N/A',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               color:
//                                                   AppColor.primaryColor,
//                                               fontSize: 14,
//                                             ),
//                                           )
//                                         : Text(
//                                             attendance.clockOut
//                                                 .toString(),
//                                             style: const TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               color:
//                                                   AppColor.primaryColor,
//                                               fontSize: 14,
//                                             ),
//                                           ),
//                                   ],
//                                 )*/
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//     )),
