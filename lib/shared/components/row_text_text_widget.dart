import 'package:flutter/material.dart';

class RowTextText extends StatelessWidget {
  Key? key;

  String name;
  String number;
  Color color;
  RowTextText(
      {super.key,
      //required this.index,
      required this.name,
      this.color = Colors.black,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 168, 168, 10),
          ),
        ),
        // SizedBox(
        //   width: 5,
        // ),
        Text(
          number,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          // maxLines: 3,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
