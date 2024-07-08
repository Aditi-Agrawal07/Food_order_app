import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_order/utils/api_endpoints.dart';
import 'package:food_order/views/home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  String errorMessage = "";

  @override
  void onInit() {
    super.onInit();
    _loadUserPreferences();
  }

  Future<void> _loadUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rememberMe = prefs.getBool('remember_me') ?? false;
    if (rememberMe) {
      emailController.text = prefs.getString('username') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
    }
  }

  Future<void> _saveUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('remember_me', rememberMe);
    if (rememberMe) {
      prefs.setString('username', emailController.text);
      prefs.setString('password', passwordController.text);
    } else {
      prefs.remove('username');
      prefs.remove('password');
    }
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginUser() async {
    try {
      
      await _saveUserPreferences();
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.loginCustomer);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };

      
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

       print(response.statusCode);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['signature'];

        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);

        emailController.clear();
        passwordController.clear();

// Get.to(()=> const HomeScreen());
         Get.offAllNamed('/location');
      } else if (response.statusCode == 400) {
        print(jsonDecode(response.body)["message"]);
        errorMessage = jsonDecode(response.body)["message"];

         Get.snackbar("Error", errorMessage, snackPosition: SnackPosition.TOP, 
        backgroundColor: Colors.red, colorText: Colors.white);
       
      }else if(response.statusCode == 404){
        errorMessage = jsonDecode(response.body)["message"];
        print('Error message $errorMessage');
        Get.snackbar("Error", errorMessage, snackPosition: SnackPosition.TOP, 
        backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (err) {
      print(err);
      throw Error();
    }
  }

  void setRememberMe(bool value) {
    rememberMe = value;
    update();
  }
}
