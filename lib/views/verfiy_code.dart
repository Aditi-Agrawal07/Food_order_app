import 'package:flutter/material.dart';
import 'package:food_order/controller/forgot_password_controller.dart';
import 'package:food_order/shared/buttons.dart';
import 'package:get/get.dart';

class Verifycodescreen extends StatefulWidget {
  const Verifycodescreen({super.key});

  @override
  State<Verifycodescreen> createState() => _VerifycodescreenState();
}

class _VerifycodescreenState extends State<Verifycodescreen> {
  final ForgotpasswordController _forgotpasswordController = Get.put(ForgotpasswordController());

  final FocusNode _digit1FocusNode = FocusNode();
  final FocusNode _digit2FocusNode = FocusNode();
  final FocusNode _digit3FocusNode = FocusNode();
  final FocusNode _digit4FocusNode = FocusNode();

    @override
  void dispose() {
    _digit1FocusNode.dispose();
    _digit2FocusNode.dispose();
    _digit3FocusNode.dispose();
    _digit4FocusNode.dispose();
    super.dispose();
  }

  void _onchanged(String value, TextEditingController controller,
      FocusNode currentNode, FocusNode nextNode) {
    if (value.length == 1) {
      currentNode.unfocus();
      FocusScope.of(context).requestFocus(nextNode);
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
         
          children: [
            const Row(
              children:[
                 Text("CODE")
              ]
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                codeInputField(
                    _forgotpasswordController.firstdigitcontroller, _digit1FocusNode, _digit2FocusNode),
                codeInputField(
                    _forgotpasswordController.seconddigitcontroller, _digit2FocusNode, _digit3FocusNode),
                codeInputField(
                    _forgotpasswordController.thirddigitcontroller, _digit3FocusNode, _digit4FocusNode),
                codeInputField(
                    _forgotpasswordController.fourthdigitcontroller, _digit4FocusNode, _digit4FocusNode),
              ],
            ),
            const SizedBox(height: 20),
            CommonButton(btntext: "Verify Code", btnmethod: _forgotpasswordController.verifyCode),
          ],
        ),
      ),
    );
  }

  Widget codeInputField(TextEditingController controller, FocusNode currentNode,
      FocusNode nextNode) {
    return Container(
      color: const Color.fromARGB(255, 198, 199, 201),
      width: 50,
      height: 50,
      child: TextFormField(
        controller: controller,
        focusNode: currentNode,
        maxLength: 1,
        textAlign: TextAlign.center,
        
        keyboardType: TextInputType.number,
        onChanged: (value) =>
            _onchanged(value, controller, currentNode, nextNode),
      decoration: const InputDecoration(
        counter: SizedBox.shrink(),
        border: InputBorder.none,
        fillColor: Color.fromARGB(255, 240, 245, 250)
      ),
      ),
    );
  }
}
