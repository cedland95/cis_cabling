import 'package:cis_cablings_app/pages/couleurs/color.dart';
import 'package:flutter/material.dart';

import 'build_time_card_total.dart';

class BuilTimeTotal extends StatelessWidget {
  const BuilTimeTotal(
      {Key? key,
      required this.hours,
      required this.minutes,
      required this.seconds})
      : super(key: key);
  final hours;
  final minutes;
  final seconds;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment(-0.85, 0),
                child: Text(
                  "Total",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 15, color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment(-0.85, 0),
                child: Text(
                  "Durata",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: bgtime,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 80),
        Row(
          children: [
            BuildTimeCardTotal(time: hours, header: 'Ore'),
            const SizedBox(width: 10),
            BuildTimeCardTotal(time: minutes, header: 'Minute'),
            const SizedBox(width: 10),
            BuildTimeCardTotal(time: seconds, header: 'Secunde'),
          ],
        ),
      ],
    );
  }
}
