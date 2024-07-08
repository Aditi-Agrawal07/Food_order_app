import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/services/validation_field.dart';


class Inputfield extends StatefulWidget {
  final String label; 
  final String hintText;
  final IconData? suffixIcon;
  final String? validationType;
  final TextEditingController textEditingController;
  final TextEditingController? passwordController;

const Inputfield({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    required this.textEditingController,
    this.validationType,
    this.passwordController
  });

  @override
  State<Inputfield> createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {

   bool obscureText = true;
     final GlobalKey<FormFieldState<String>> _fieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {

     final validation_field validationField = validation_field();
    return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text(
      widget.label,
      style: const TextStyle(color: Colors.black),
    ),
    const SizedBox(height: 10,),
    TextFormField(
      key: _fieldKey,
     controller: widget.textEditingController,
     obscureText: obscureText && widget.validationType == 'Password',
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 160, 165, 186) ),
        filled: true,
        suffixIcon: widget.validationType == 'Password'
                ? IconButton(
                    icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : null,
        fillColor: const Color.fromARGB(255, 240, 245, 250),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {

        if(widget.validationType == "Email"){
         return validationField.validateEmail(value);
        }
       else if(widget.validationType == "Password"){
        if (widget.passwordController != null && value != widget.passwordController!.text) {
                return "Passwords do not match";
              }
        return validationField.validateAlphanumericPassword(value);
       }
        // You can add more validation logic here if needed
        return null;
      },
      onSaved: (value) {
        // You can save the entered value to a variable or perform other actions here
      },
    ),
    const SizedBox(height: 15.0,),
  ],
);
  }
}

class Sociallogin extends StatelessWidget {
  final FaIcon icon;
  final Color backgroundColor;
  const Sociallogin({super.key, required this.icon, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor, // Set background color here
        borderRadius: BorderRadius.circular(40), // Optional: Add border radius
      ),
      child: IconButton(
        icon: icon,
        onPressed: ()=>{},
        iconSize: 32, // Adjust the icon size as needed
        color: Colors.white
      ),
    );
  }
}