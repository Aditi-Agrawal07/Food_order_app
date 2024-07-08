import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/controller/forgot_password_controller.dart';
import 'package:food_order/controller/login_controller.dart';
import 'package:food_order/controller/register_controller.dart';
import 'package:food_order/shared/buttons.dart';
import 'package:food_order/shared/input_field.dart';
import 'package:food_order/shared/register_pages.dart';
import 'package:food_order/views/verfiy_code.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final RegisterController _registerController = Get.put(RegisterController());
  final LoginController _loginController = Get.put(LoginController());
  final ForgotpasswordController _forgotpasswordController = Get.put(ForgotpasswordController());
  final RxInt screenState = 0.obs;

  final GlobalKey<FormState> registerformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotpassformKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Commonregisterpage(
        customForm: _buildCustomForm(),
        formtitle: _buildFormTitle(),
        formSubtitle: _buildFormSubtitle(),
      )),
    );
  }

  // Custom form rendering
   Widget _buildCustomForm() {
    switch (screenState.value) {
      case 0:
        return LoginWidget(context);
      case 1:
        return RegisterWidget(context);
      case 2:
        return forgotPasswordWidget();
      case 3:
        return const Verifycodescreen();
      default:
        return Container(); // Handle other cases or unexpected values
    }
  }

  // custom title rendering
  String _buildFormTitle() {
    switch (screenState.value) {
      case 0:
        return 'Log In';
      case 1:
        return 'Sign Up';
      case 2:
        return 'Forgot Password';
      case 3:
        return 'Verify Code';
      default:
        return ''; // Handle other cases or unexpected values
    }
  }

  // custom subtitle rendering
  String _buildFormSubtitle() {
    switch (screenState.value) {
      case 0:
        return 'Please sign in to your existing account';
      case 1:
        return 'Please create a new account';
      default:
        return ''; // Handle other cases or unexpected values
    }
  }


  // ignore: non_constant_identifier_names
  Widget RegisterWidget(context) {
    return SingleChildScrollView(
      child: Form(
      key: registerformKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Inputfield(
                textEditingController: _registerController.nameController,
                label: "NAME",
                hintText: "john doe",
              ),
              Inputfield(
                textEditingController: _registerController.emailController,
                label: "EMAIL",
                hintText: "example@gmail.com",
                validationType: "Email"
              ),
              Inputfield(
                textEditingController: _registerController.passwordController,
                label: "PASSWORD",
                hintText: "* * * * * *",
                suffixIcon: Icons.visibility,
                validationType: "Password",
              ),
              Inputfield(
                textEditingController: _registerController.retypepasswordController,
                label: "RE-TYPE PASSWORD",
                hintText: "* * * * * *",
                suffixIcon: Icons.visibility,
                validationType: "Password",
                passwordController: _registerController.passwordController,

              ),
              const SizedBox(height: 20.0),
              CommonButton(btntext: "Sign up",
               btnmethod: () async{
                 if (registerformKey.currentState?.validate() ?? false) {
                  await _registerController.registerUser();
                }
               }
             ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LoginWidget(context) {
    return SingleChildScrollView(
      child: Form(
        key: loginformKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Inputfield(
                textEditingController: _loginController.emailController,
                label: "Email",
                hintText: "example@gmail.com",
                validationType: "Email",
              ),
              Inputfield(
                textEditingController: _loginController.passwordController,
                label: "Password",
                hintText: "* * * * * *",
                suffixIcon: Icons.visibility,
                validationType: "Password",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                      value: _loginController.rememberMe,
                      onChanged: (value) {
                        setState(() {
                         _loginController.setRememberMe(value!);

                        });
                      },
                    ),
                const Text('Remember Me'),
                    ],
                  ),
                  InkWell(
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.orange),
                    ),
                    onTap: () {
                      screenState.value = 2;
                    },
                  ),
                ],
              ),
          
              CommonButton(btntext: "Login",
               btnmethod: _loginController.loginUser),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Don't have an account ?"),
                  ),
                  InkWell(
                    onTap: () {
                      screenState.value = 1;
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Sociallogin(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    backgroundColor: Colors.blue,
                  ),
                  Sociallogin(
                    icon: FaIcon(FontAwesomeIcons.google),
                    backgroundColor: Colors.orange,
                  ),
                  Sociallogin(
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    backgroundColor: Color.fromRGBO(57, 89, 152, 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget forgotPasswordWidget() {
    return SingleChildScrollView(
      child: Form(
        key: forgotpassformKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Inputfield(
                textEditingController: _forgotpasswordController.emailController,
                label: "Email",
                hintText: "example@gmail.com",
              ),
              const SizedBox(height: 10,),
               CommonButton(btntext: "SEND CODE",
                btnmethod: ()async{
                  await _forgotpasswordController.sendCode();
                  screenState.value = 3;
                  
                }
                ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Sociallogin(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    backgroundColor: Colors.blue,
                  ),
                  Sociallogin(
                    icon: FaIcon(FontAwesomeIcons.google),
                    backgroundColor: Colors.orange,
                  ),
                  Sociallogin(
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    backgroundColor: Color.fromRGBO(57, 89, 152, 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
