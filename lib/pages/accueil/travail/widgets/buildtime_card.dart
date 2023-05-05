import 'package:flutter/material.dart';

import '../../../couleurs/color.dart';


class BuildTimeCard extends StatelessWidget {
  const BuildTimeCard({Key? key, required this.time, required this.header})
      : super(key: key);
  final String time;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            //color: textColor,
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 253, 252, 252),
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                color: textcolor3,
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        //const SizedBox(height: 3),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            header,
            style: TextStyle(
              color: textcolor3,
              fontSize: 10,
              fontFamily: 'Poppins',
            ),
          ),
        ))
      ],
    );
  }
}
