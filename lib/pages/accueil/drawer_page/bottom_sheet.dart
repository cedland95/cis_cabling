import 'package:flutter/material.dart';

import '../../couleurs/color.dart';

class BuildSheet extends StatefulWidget {
  const BuildSheet({Key? key}) : super(key: key);

  @override
  State<BuildSheet> createState() => _BuildSheetState();
}

class _BuildSheetState extends State<BuildSheet> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Vrei sa te deconectezi?',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.green,
                      child: const Text('DA',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                      child: const Text('NU',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          )),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
            top: -15,
            child: Container(
              width: 60,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            )),
        Container(
          //padding: EdgeInsets.all(16),
          //height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/images/LogoCIS.png',
                    height: 100.0, width: 100.0),
              ),
              //const SizedBox(height: 10),
              Text('Osseng',
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor2,
                    fontFamily: 'Poppins',
                  )),
              Text('cedlandosseng@gmail.com',
                  style: TextStyle(
                    fontSize: 12,
                    color: textColor2,
                    fontFamily: 'Poppins',
                  )),
              const SizedBox(height: 15),
              Card(
                color: Colors.blue,
                margin: EdgeInsets.only(left: 105, right: 105),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _showDialog();
                  },
                  icon: const Icon(
                    // <-- Icon
                    Icons.logout,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  // <-- Text
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
