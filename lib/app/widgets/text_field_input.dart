import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Function(String)? onChanged;

  const TextFieldInput({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.isPass = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        hintStyle: GoogleFonts.poppins(),
      ),
      style: GoogleFonts.poppins(),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
