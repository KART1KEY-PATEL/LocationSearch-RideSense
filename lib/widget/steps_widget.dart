

import 'package:flutter/material.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({
    super.key,
    required this.sH,
    required this.sW,
    required this.stepNumber,
    required this.title,
    required this.isActive,
  });

  final double sH;
  final double sW;
  final String stepNumber;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CircleAvatar(
            radius: sW * 0.07,
            backgroundColor: isActive ? Colors.red : Colors.white,
            child: Text(
              stepNumber,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.red,
                fontSize: sH * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}