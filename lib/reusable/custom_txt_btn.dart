
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title;
  final VoidCallback  onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall
      ),
    );
  }
}
