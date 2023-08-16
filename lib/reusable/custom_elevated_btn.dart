
import 'package:flutter/material.dart';
import 'package:todo_app/templets/colors.dart';

class CustomElevatedBtn extends StatelessWidget {
   CustomElevatedBtn({Key? key, required this.text, required this.onPRessed, this.color=AppColors.Primary}) : super(key: key);

   final String text;
   final VoidCallback onPRessed;
   Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPRessed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
          backgroundColor: MaterialStateProperty.all(color)
      ),
        child:  Text(text),
    );
  }
}
