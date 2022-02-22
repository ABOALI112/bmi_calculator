import 'package:flutter/material.dart';

class leftbar extends StatelessWidget {
  const leftbar({Key? key, required this.BarWidth}) : super(key: key);
  final double BarWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: BarWidth,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
