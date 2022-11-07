import 'package:flutter/material.dart';

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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13.5,
          ),
        ),
      ],
    );
  }
}
