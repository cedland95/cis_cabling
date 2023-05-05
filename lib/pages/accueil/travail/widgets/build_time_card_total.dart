import 'package:flutter/material.dart';

import '../../../couleurs/color.dart';


class BuildTimeCardTotal extends StatelessWidget {
  const BuildTimeCardTotal({Key? key, required this.time, required this.header})
      : super(key: key);
  final time;
  final header;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width:40,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            //color: textColor,
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
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
        //const SizedBox(height: 4),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            header,
            style: TextStyle(
              color: bgColor,
              fontSize: 10,
              fontFamily: 'Poppins',
            ),
          ),
        ))
      ],
    );
  }
}
