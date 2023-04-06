import 'package:clean_a/src/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static showErrorDialog(
      {required BuildContext context, required String message}) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Text(message),
              content: Text("This is a test message"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text("OK"))
              ],
            ));
  }

  static showToast(
      {required String message, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: color ?? AppColors.primary,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }
}
