import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Helper {
  void showSmackBar(
      {required BuildContext context,
      required String message,
      bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsetsDirectional.only(end: 30, start: 30, bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        action: SnackBarAction(
            onPressed: () {}, label: 'Done', textColor: Colors.red),
        onVisible: () => print('onVisible'),
        elevation: 0,
      ),
    );
  }
}
