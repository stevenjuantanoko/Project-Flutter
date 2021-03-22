import 'package:flutter/material.dart';

import 'MainPage.dart';

class Button extends StatelessWidget {
  void DataPass(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RaisedButton(
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          DataPass(context);
        },
      ),
    ));
  }
}
