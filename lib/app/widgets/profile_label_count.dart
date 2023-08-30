import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileLabelCount extends StatelessWidget {
  const ProfileLabelCount({
    Key? key,
    required this.labelText,
    required this.count,
  }) : super(key: key);

  final String labelText;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Text(
          labelText,
          style:
              GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 13.5),
        ),
      ],
    );
  }
}
