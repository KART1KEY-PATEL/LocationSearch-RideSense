import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({
    super.key,
    required this.sW,
    required this.isActive,
  });

  final double sW;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: sW * 0.2,
        height: 2,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          separatorBuilder: (context, index) {
            return Container(
              width: 4,
            );
          },
          itemBuilder: (context, index) {
            return Container(
              height: 1,
              width: 5,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isActive ? Colors.red : Colors.grey,
                    width: 1.5,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
