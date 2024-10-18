import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controllers/auth-controller.dart';
import '../../Models/company_modul.dart';
import '../../Models/customer_model.dart';
import '../../Services/api-list.dart';
import '../../constants/constants.dart';
import '../../constants/size_config_data.dart';
import '../widget/loader.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isChecked = false;

  List<String> companyNames = [];
  Map<String, String> companyMap = {};

  List<Customerlist>? customerlist=[];

  Map<String, String> customerMap = {};

  String? _selectedCompany;
  String? _selectedCustomer;

  Future<void> getcompany() async {
    try {
      final response = await http.get(Uri.parse(APIList.company!),
          headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var companyListData = data['CompanyList'] as List<dynamic>;

        setState(() {
          companyNames.clear();
          companyMap = {}; // Initialize companyMap
          companyNames = companyListData
              .map<String>((company) => company['company_name'].toString())
              .toList();

          // Populate companyMap with company name to ID mappings
          for (var company in companyListData) {
            companyMap[company['company_name']] = company['company_id'];
          }
        });
        print('Number of companies: ${companyNames.length}');
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error selecting your company: $error');
    }
  }

  Future<void> getcustomer(String companyId) async {
    try {
      final response = await http.post(
        Uri.parse(APIList.customer!),
        headers: {"Accept": "application/json"},
        body: {
          "companyID": companyId,
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var customerListData = data['Customerlist'] as List<dynamic>;

        setState(() {
          customerlist!.clear();
          customerMap.clear(); // Clear existing data in the map
          customerlist = customerListData
              .map((customerJson) => Customerlist.fromJson(customerJson))
              .toList();

          // Populate customerMap with customer name to ID mappings
          for (var customer in customerlist!) {
            customerMap[customer.customerName!] = customer.customerId!;
          }
        });
        print('Number of customers: ${customerlist!.length}');
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error selecting customers: $error');
    }
  }

  @override
  void initState() {
    super.initState();

    getcompany();

  }

  void saveSessionData(String companyName, String companyId, String customerName, String customerId) async {
    SharedPreferences complist = await SharedPreferences.getInstance();
    await complist.setString('companyName', companyName);
    await complist.setString('companyId', companyId);
    await complist.setString('customerName', customerName);
    await complist.setString('customerid', customerId);

    print("Selected company saved to session: $companyName");
    print("Selected company ID saved to session: $companyId");
    print("Customer ID saved to session: $customerId");
    print("Customer name saved to session: $customerName");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigData sizeConfig = SizeConfigData();
    sizeConfig.init(context);
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (auth) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 0.0,
                    bottom: 0.0,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Image.asset(
                                          'assets/images/profilelogo.png',
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'login_form'.tr,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'email'.tr,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.nameColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (_emailController.text.isEmpty) {
                                            return "this_field_can_t_be_empty"
                                                .tr;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          fillColor: Colors.red,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12.0),
                                            ),
                                            borderSide: BorderSide(
                                              color: AppColor.dividerColor,
                                              width: 1.0,
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColor.borderColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'password'.tr,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.nameColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: _passwordController,
                                        validator: (value) {
                                          if (_passwordController
                                              .text.isEmpty) {
                                            return "this_field_can_t_be_empty"
                                                .tr;
                                          }
                                          return null;
                                        },
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          fillColor: Colors.red,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12.0),
                                            ),
                                            borderSide: BorderSide(
                                              color: AppColor.dividerColor,
                                              width: 1.0,
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColor.borderColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // Company selection
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IgnorePointer(
                                        ignoring: _selectedCompany != null, // Ignore pointer events if a company is selected
                                        child: DropdownButtonFormField<String>(
                                          value: _selectedCompany,
                                          items: companyNames
                                              .map<DropdownMenuItem<String>>(
                                                (String value) => DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ),
                                          )
                                              .toList(),
                                          onChanged: (String? value) async {
                                            setState(() {
                                              _selectedCompany = value;
                                            });
                                            if (_selectedCompany != null) {
                                              String companyId = companyMap[value!] ?? '';
                                              String companyName = value ?? '';
                                              // Call getcustomer() with the companyId parameter
                                              await getcustomer(companyId);
                                              // Optionally, you can also save the selected company data here
                                              saveSessionData(companyName, companyId, _selectedCustomer!, customerMap[_selectedCustomer!]!);
                                            }
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: '---Select Company---',
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please select a company';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                                      child: DropdownButtonFormField<String>(
                                        value: _selectedCustomer,
                                        items: customerlist != null
                                            ? customerlist!
                                            .map<DropdownMenuItem<String>>(
                                              (customer) => DropdownMenuItem<String>(
                                            value: customer.customerName!,
                                            child: Text(customer.customerName!),
                                          ),
                                        )
                                            .toList()
                                            : [],
                                        onChanged: (String? value) {
                                          setState(() {
                                            _selectedCustomer = value;
                                          });
                                          if (_selectedCompany != null) {
                                            String companyId = companyMap[_selectedCompany!] ?? '';
                                            String companyName = _selectedCompany ?? '';
                                            saveSessionData(companyName, companyId, value!, customerMap[value]!);
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '---Select Customer---',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please select a customer';
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ), // Adjust the font size as needed
                                        isExpanded: true, // Expand the dropdown button to fill available space
                                        itemHeight: 50, // Set the height of each dropdown item
                                      ),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size.fromHeight(60),
                                          backgroundColor:
                                              AppColor.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            auth.loginOnTap(
                                              email: _emailController.text
                                                  .toString()
                                                  .trim(),
                                              pass: _passwordController.text
                                                  .toString()
                                                  .trim(),
                                            );
                                          }
                                        },
                                        child: Text(
                                          "login".tr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      auth.loader
                          ? Positioned(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white60,
                                child: const Center(child: LoaderCircle()),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ));


  }

}
