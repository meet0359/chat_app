// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String) onSaved;
  final String regx;
  final String hinttext;
  final bool obscureText;

  const CustomTextFormField(
      {super.key,
      required this.regx,
      required this.hinttext,
      required this.obscureText,
      required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (_value) => onSaved(_value!),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      validator: (_value) {
        return RegExp(regx).hasMatch(_value!) ? null : 'Enter a valid value.';
      },
      decoration: InputDecoration(
          fillColor: const Color.fromRGBO(30, 29, 37, 1.0),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.white)
          ),
    );
  }
}
