import 'package:clone_instagram/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

alertDialog(
  context,
  AlertType type,
  String title,
  String text,
) {
  Alert(
    context: context,
    type: AlertType.none,
    title: title,
    desc: text,
    style: AlertStyle(
      backgroundColor: Colors.white,
      titleStyle:
          GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w700),
      descStyle: GoogleFonts.poppins(color: Colors.black),
    ),
    buttons: [
      DialogButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        width: 120,
        color: blue,
        child: Text("Ok",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
        onPressed: () => Navigator.pop(context),
      )
    ],
  ).show();
}
