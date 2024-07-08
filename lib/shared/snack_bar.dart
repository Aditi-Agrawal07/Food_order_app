import 'package:flutter/material.dart';


class DialogBox{

   void showErrorDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Login Failed"),
          content: const Text("The email or password you entered is incorrect. Please try again or sign up."),
          actions: <Widget>[
            TextButton(
              child: const Text("Try Again"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Sign Up"),
              onPressed: () {
                // Navigate to sign up screen
                Navigator.of(context).pop();
                // Replace with your sign up screen navigation logic
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(builder: (context) => SignUpScreen()),
                // );
              }
            )
          ]
        );
      }
    );
}
}