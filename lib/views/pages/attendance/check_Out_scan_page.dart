import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilochanaa_app/constants/constants.dart';
import 'package:trilochanaa_app/views/widget/TextFieldWithNoKeyboard.dart';

import '../../../Services/api-list.dart';
class checkOut extends StatefulWidget {
  const checkOut({Key? key}) : super(key: key);

  @override
  State<checkOut> createState() => _checkOutState();
}

class _checkOutState extends State<checkOut> {
  TextEditingController partQR = TextEditingController();
  String qrCode = 'unknown';

  String? masterID;
  String? QrValue;
  String? boxQr;
  String? customerID;
  String? companyID;
  String? shift;


  Future<void> checkOutcode() async {
    print("Call Function check OUT");

    print(qrCode);
    print(companyID);
    print(customerID);

    try {
      final response = await http.post(
        Uri.parse(APIList.checkOut!),
        headers: {"Accept": "application/json"},
        body: {
          "company_id": companyID,
          "customer_id": customerID,
          "shift": shift,
          "employee_code": qrCode
        },
      );
      partQR.clear();
      print("Bar Code Scanner ...........");
      print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(response.body);
        if (data['status'] == "Success") {
          print("Scan Testing....;");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              data['message'].toString(),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.green,
            elevation: 10,
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(15),
          ));
          setState(() {
            partQR.clear();

            //Constant.sendToNext(context, Routes.FinishGoodsMainRoute);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              data['message'].toString(),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
            elevation: 10,
            duration: const Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(15),
          ));
        }
      } else {
        // Handle other status codes if needed
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Invalid QR! $e",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(15),
      ));
      throw Future.error(e);
    }
  }

  get_sessionData() async {
    SharedPreferences complist = await SharedPreferences.getInstance();
    setState(() {
      customerID = complist.getString('customerid').toString();
      companyID = complist.getString('companyId').toString();
      shift = complist.getString('ShiftName').toString();
    });
    print("customer Id is ${(customerID)}");
    print("company Id is ${(companyID)}");
    print("company Shift is ${(shift)}");
  }


  void initState() {
    //pickdetaildata();
    get_sessionData();

    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        Map args = ModalRoute.of(context)?.settings.arguments as Map;
        masterID = args['master'];

        print("test...........");
        print(masterID);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Check Out',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
              // Handle the back button press, e.g., navigate to the previous screen.
              // Constant.backToPrev(context);
            },
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/scan.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              getPaddingWidget(
                EdgeInsets.fromLTRB(2, 0, 2, 0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // getVerSpace(FetchPixels.getPixelHeight(152)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            scanQRCode();
                          },
                          child: Container(
                            height: 70.0,
                            width: 180.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 180,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Scan QR',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: true,
                      child: TextFieldWithNoKeyboard(
                        controller: partQR,
                        autofocus: true,
                        cursorColor: Colors.black,
                        onValueUpdated: (value) {
                          this.qrCode = partQR.text;
                          if (partQR.text.isNotEmpty && partQR.text != '-1') {
                            if (partQR.text.isNotEmpty) {
                              setState(() {
                                checkOutcode();
                                print("fdg");
                              });
                            }
                          }
                        },
                        selectionColor: Colors.black,
                        style: TextStyle(color: Color(0xFFc3b3a8)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        // Constant.backToPrev(context);
        return false;
      },
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode1 = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        print(qrCode1);
        this.qrCode = qrCode1;
        partQR.text = qrCode;
        print(partQR.text);
        if (partQR.text.isNotEmpty && partQR.text != '-1') {
          if (partQR.text.isNotEmpty) {
            checkOutcode();
            /*  Get.toNamed(Routes.scanLocationQR,arguments: {"container_no":get_container_no,
              "material_code":get_material_code,"put_id":get_put_id,"company_id":get_company_id,"warehouse_id":get_warehouse_id*/
            //   });
          }

          if (partQR.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Container Code Wrong Try Again',
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.red,
              elevation: 10,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(15),
            ));
          }
          if (partQR.text.isEmpty) {
            partQR.clear();
            //   FlutterBeep.beep(false);
          }
          ;
        } else {
          partQR.clear();
          //   FlutterBeep.beep(false);
        }
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version';
    }
  }
  Widget getPaddingWidget(EdgeInsets edgeInsets, Widget widget) {
    return Padding(
      padding: edgeInsets,
      child: widget,
    );
  }
  Widget getVerSpace(double verSpace) {
    return SizedBox(
      height: verSpace,
    );
  }
}
