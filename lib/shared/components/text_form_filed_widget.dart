import 'package:flutter/material.dart';

class buildTextFormFiled extends StatelessWidget {
  String? lableText;
  TextEditingController? controller;
  Widget iconPri;
  Widget? iconSuf;
  String? Function(String?)? validator;
  TextInputType textType;
  bool obscureText = false;

  buildTextFormFiled({
    required this.lableText,
    required this.controller,
    required this.iconPri,
    this.iconSuf,
    this.validator,
    required this.textType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: textType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: lableText,
        prefixIcon: iconPri,
        suffix: iconSuf,
        border: OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10.0),
        ),
        // enabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
      ),
    );
  }
}
