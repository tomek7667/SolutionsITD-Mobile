import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';

var _isLoadingDialogVisible = false;

void showLoadingDialog(BuildContext context) {
  if (_isLoadingDialogVisible) {
    return;
  }
  _isLoadingDialogVisible = true;
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Center(
        child: LoadingAnimationWidget.dotsTriangle(
          color: AppColors.turquoise,
          size: 100.0,
        ),
      );
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  if (!_isLoadingDialogVisible) {
    return;
  }
  Navigator.of(context).pop();
  _isLoadingDialogVisible = false;
}

void showSuccessDialog(BuildContext context, String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.greenAccent,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
