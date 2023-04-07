import 'package:clean_a/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        child: Text(
          "more",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
