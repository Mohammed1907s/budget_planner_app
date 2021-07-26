import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Helpers {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<bool> deleteDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    bool status = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(
                    SizeConfig.scaleHeight(25)),
                side: BorderSide(color: Colors.red.shade900, width: 2)),
            title: TextApp(
              text: title,
              fontSize: 15,
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
            ),
            content: TextApp(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              text: content,
              fontSize: 12,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: TextApp(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  text: 'No',
                  fontSize: 12,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: TextApp(
                  text: 'YES',
                  fontSize: 12,
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          );
        });
    return status;
  }
}
