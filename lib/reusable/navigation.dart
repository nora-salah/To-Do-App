
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/templets/colors.dart';


void navigate({required BuildContext context,required Widget screen}){
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (_) => screen ));
}

void showToast({required String message ,required ToastStates state}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastStates{error ,success,warining}
Color getState(ToastStates state){
  switch(state){
    case ToastStates.error: return AppColors.red;
    case ToastStates.success: return AppColors.Primary;
    case ToastStates.warining: return AppColors.orange;


  }
}