import 'package:flutter/material.dart';

import '../templets/strings.dart';

class AddTaskComponent extends StatelessWidget {
  AddTaskComponent(
      {Key? key,
       this.controller,
        this.suffixIcon,
      required this.title,
      required this.hintText,  this.readOnly=false,  this.validator})
      : super(key: key);
  final TextEditingController? controller;
  final String title;
  final String hintText;
final IconButton? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            validator: validator,
            controller: controller,
            readOnly:readOnly ,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,

            ),
          ),
        ],
      )
    ;
  }
}
