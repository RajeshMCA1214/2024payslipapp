import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast package
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilochanaa_app/AddedComponant/color_data.dart';
import 'package:trilochanaa_app/views/pages/profile.dart';

import '../../AddedComponant/color_data.dart';
import '../../Controllers/dashboard_controller.dart';
import '../../Controllers/profile_controller.dart';
import '../../Services/api-list.dart';
import 'dashboard/employee_dashboard_page.dart';

class ChangeNEWPassword extends StatefulWidget {
  const ChangeNEWPassword({Key? key}) : super(key: key);

  @override
  State<ChangeNEWPassword> createState() => _ChangeNEWPasswordState();
}

class _ChangeNEWPasswordState extends State<ChangeNEWPassword> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  String name = '';
  String email = '';
  String phone = '';
  String companyNAME = '';
  String ID = '';

  Future<String?> getNameFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    String? phone = prefs.getString('phone');
    String? ID = prefs.getString('user_id');

    setState(() {
      this.name = name ?? '';
      this.email = email ?? '';
      this.phone = phone ?? '';
      this.ID = ID ?? '';
    });
    getData(context);
    _usernameController.text = name ?? '';
    print('Name from SharedPreferences: $name');
    print('mail from SharedPreferences: $email');
    print('phone from SharedPreferences: $phone');
    print('ID from SharedPreferences: $ID');
    return name;
  }

  @override
  void initState() {
    super.initState();
    getNameFromPrefs();
  }
  Future<void> getData(BuildContext context) async {
    print("No_ Imagesssss..................");

    try {
      print("welcome try block");

      final response = await http.post(
        Uri.parse(APIList.changepassword!),
        headers: {"Accept": "application/json"},
        body: {
          "user_id": ID,
          "old_password": _oldPasswordController.text,
          "new_password": _newPasswordController.text,
          "confirm_password": _confirmPasswordController.text
        },
      );

      if (response.statusCode == 200) {
        print('imn');
        print(response.body);
        print('hello');

        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('hiiii');

        if (responseData.containsKey('message')) {
          // Check the message from the response
          final String message = responseData['message'];

          if (message == "Password updated successfully") {
            // Password updated successfully, show toast message
            Fluttertoast.showToast(
              msg: message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );

            // Navigate to ProfilePage
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ProfileScreen()), // Replace ProfileScreen with the actual widget representing the profile screen
            // );

          } else {
            // Show toast message for other cases
            Fluttertoast.showToast(
              msg: message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        } else {
          print("message key not found in response. Response data structure: $responseData");
        }
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      // Error occurred while updating password, show error toast message
      Fluttertoast.showToast(
        msg: "Failed to update password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print("$e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(
            color: Colors.black, // Text color
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black, // Back button color
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back when back button is pressed
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Old Password',
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate and process password change
                        if (_newPasswordController.text == _confirmPasswordController.text) {
                          getData(context); // Pass the context
                        } else {
                          // Show toast message for password mismatch
                          Fluttertoast.showToast(
                            msg: "Passwords do not match",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(blueColor), // Set background color
                      ),
                      child: Text('Confirm'),
                    ),
                  ),



                  // Expanded(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => DashboardController(),
                  //           ),
                  //         );
                  //
                  //     },
                  //     child: Text('Cancel'),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
