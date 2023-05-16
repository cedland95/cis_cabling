import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'dart:async';
import '../../couleurs/color.dart';
import 'bouton_action.dart';
import 'widgets/buidtime_total.dart';
import 'widgets/buildtime_card.dart';

class Travail extends StatefulWidget {
  const Travail({Key? key}) : super(key: key);

  @override
  State<Travail> createState() => _TravailState();
}

class _TravailState extends State<Travail> {
  List<dynamic> proiect = [];
  List<dynamic> fabrication = [];
  List<dynamic> produs = [];
  List<dynamic> operare = [];
  List<dynamic> states = [];
  List<dynamic> statesO = [];
  List<dynamic> states1 = [];

  String? proiectId;
  String? fabricationId;
  String? produsId;
  String? operareId;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _formKeypiece = GlobalKey<FormState>();
  String? _selection;

  @override
  void initState() {
    super.initState();
    proiect.add({'id': 1, 'name': 'Proiect-1'});
    proiect.add({'id': 2, 'name': 'Proiect-2'});
    proiect.add({'id': 3, 'name': 'Proiect-3'});

    fabrication = [
      {'ID': 1, 'Name': 'Proiect1-01', 'ParentId': 1},
      {'ID': 2, 'Name': 'Proiect1-02', 'ParentId': 1},
      {'ID': 1, 'Name': 'Proiect2-01', 'ParentId': 2},
      {'ID': 2, 'Name': 'Proiect2-02', 'ParentId': 2},
      {'ID': 1, 'Name': 'Proiect3-01', 'ParentId': 3},
      {'ID': 2, 'Name': 'Proiect3-02', 'ParentId': 3},
    ];
    produs = [
      {'Id': 1, 'Names': 'Proiect1-01-Pro1', 'ParentID': 1},
      {'Id': 2, 'Names': 'Proiect1-01-Pro2', 'ParentID': 1},
      {'Id': 1, 'Names': 'Proiect2-02-Pro1', 'ParentID': 2},
      {'Id': 2, 'Names': 'Proiect2-02-Pro2', 'ParentID': 2},
      {'Id': 1, 'Names': 'Proiect3-03-Pro1', 'ParentID': 3},
      {'Id': 2, 'Names': 'Proiect3-03-Pro2', 'ParentID': 3},
    ];

    operare = [
      {'Ido': 1, 'Nameso': 'Proiect1-01-Pro1-opp1', 'ParentID': 1},
      {'Ido': 2, 'Nameso': 'Proiect1-01-Pro1-opp2', 'ParentID': 1},
      {'Ido': 1, 'Nameso': 'Proiect2-02-Pro2-opp1', 'ParentID': 2},
      {'Ido': 2, 'Nameso': 'Proiect2-02-Pro2-opp2', 'ParentID': 2},
      {'Ido': 1, 'Nameso': 'Proiect3-03-Pro3-opp1', 'ParentID': 3},
      {'Ido': 2, 'Nameso': 'Proiect3-03-Pro3-opp2', 'ParentID': 3},
    ];
  }

  bool startispressed = true;
  bool stopispressed = true;
  bool pauseispressed = true;
  bool controlispressed = true;
  String stoptimetodisplay = "00:00:00";
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);

  void starttimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (swatch.isRunning) {
      starttimer();
    }
    setState(() {
      stoptimetodisplay = "${swatch.elapsed.inHours.toString().padLeft(2, "0")}"
          ":${(swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0")}"
          ":${(swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0")}";
    });
  }

  void startstopwatch() {
    setState(() {
      stopispressed = false;
      startispressed = false;
      pauseispressed = false;
      controlispressed = false;
      proiect = [];
      states = [];
      statesO = [];
      states1 = [];
    });
    swatch.start();
    starttimer();
  }

  void stopstopwatch() {
    swatch.stop();
    _showDialogpiece();
    setState(() {
      startispressed = true;
      stopispressed = true;
      pauseispressed = true;
    });
  }

  void pausestopwatch() {
    swatch.stop();
    pauseispressed = true;
    setState(() {
      startispressed = true;
      stopispressed = false;
    });
  }

  void handleStartStop() {
    if (swatch.isRunning) {
      swatch.stop();
      setState(() {
        startispressed = true;
        stopispressed = false;
        pauseispressed = true;
      });
    } else {
      swatch.start();
      starttimer();
      setState(() {
        startispressed = false;
        stopispressed = false;
        pauseispressed = false;
      });
    }
  }

  void _showDialogpiece() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                      key: _formKeypiece,
                      child: Column(
                        children: [
                          const Text(
                            'introduceți numărul de piese',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez saisir du texte';
                              }
                              return null;
                            },
                          ),
                        ],
                      ))
                ],
              ),
              actions: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (_formKeypiece.currentState!.validate()) {
                          Navigator.pop(context);
                          _showDialog();
                        }
                      },
                      color: Colors.green,
                      child: const Text('CONFIRMA',
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
                      color: Colors.black,
                      child: const Text('ANULARE',
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

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Validați operațiunea?',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Dacă confirmați, datele dumneavostră vor fi',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: textColor2,
                    ),
                  ),
                  const SizedBox(
                    height: 1.5,
                  ),
                  Text(
                    'Salvate și nu pot fi modificate ',
                    style: TextStyle(
                      fontSize: 10.5,
                      fontFamily: 'Poppins',
                      color: textColor2,
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
                        _showDialogconf();
                      },
                      color: Colors.green,
                      child: const Text('CONFIRMA',
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
                      color: Colors.black,
                      child: const Text('ANULARE',
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

  void _showDialogconf() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: const Text(
                'Operațiune validată !',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              actions: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.black,
                      child: const Text(
                        'ÎNCHIDE',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
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
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Colors.blue,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: BuilTimeTotal(
                        hours:
                            swatch.elapsed.inHours.toString().padLeft(2, "0"),
                        minutes: (swatch.elapsed.inMinutes % 60)
                            .toString()
                            .padLeft(2, "0"),
                        seconds: (swatch.elapsed.inSeconds % 60)
                            .toString()
                            .padLeft(2, "0"),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment(-0.857, 0),
                      child: Text(
                        "Lista de proiect",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                        //textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: FormHelper.dropDownWidget(
                        context,
                        'Selectați proiect',
                        proiectId,
                        proiect,
                        (onChangedVal) {
                          proiectId = onChangedVal;
                          states = fabrication
                              .where(
                                (stateItem) =>
                                    stateItem['ParentId'].toString() ==
                                    onChangedVal.toString(),
                              )
                              .toList();
                          fabricationId = null;
                          setState(() {});
                        },
                        (onValidateVal) {
                          if (onValidateVal == null) {
                            return 'Please Select Proiect';
                          }
                          return null;
                        },
                        //borderColor: Theme.of(context).primaryColor,
                        borderColor: Colors.white,
                        borderFocusColor: Colors.white,
                        borderRadius: 8,
                        //paddingLeft: 85,
                        paddingRight: 10,

                        //optionValue: 'idFabrication',
                        //optionLabel: 'codeFabrication',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment(-0.857, 0),
                      child: Text(
                        "Lista de activitaty",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: FormHelper.dropDownWidget(
                        context,
                        'Selectați  Activitati',
                        fabricationId,
                        states,
                        (onChangedVal) {
                          fabricationId = onChangedVal;
                          statesO = produs
                              .where(
                                (stateItem) =>
                                    stateItem['ParentID'].toString() ==
                                    onChangedVal.toString(),
                              )
                              .toList();
                          produsId = null;
                          setState(() {});
                        },
                        (onValidateVal) {
                          if (onValidateVal == null) {
                            return 'Please Select Activitaty';
                          }
                          return null;
                        },
                        borderColor: Colors.white,
                        borderFocusColor: Colors.white,
                        borderRadius: 8,
                        //paddingLeft: 85,
                        paddingRight: 10,
                        optionValue: 'ID',
                        optionLabel: 'Name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment(-0.857, 0),
                      child: Text(
                        "Lista de produs",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: FormHelper.dropDownWidget(
                        context,
                        'Selectați  Operare',
                        produsId,
                        statesO,
                        (onChangedVal) {
                          produsId = onChangedVal;
                          states1 = operare
                              .where(
                                (stateItem) =>
                                    stateItem['ParentID'].toString() ==
                                    onChangedVal.toString(),
                              )
                              .toList();
                          operareId = null;
                          setState(() {});
                        },
                        (onValidateVal) {
                          if (onValidateVal == null) {
                            return 'Please Select Produs';
                          }
                          return null;
                        },
                        borderColor: Colors.white,
                        borderFocusColor: Colors.white,
                        borderRadius: 8,
                        //paddingLeft: 85,
                        paddingRight: 10,
                        optionValue: 'Id',
                        optionLabel: 'Names',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment(-0.857, 0),
                      child: Text(
                        "Lista de operare",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: FormHelper.dropDownWidget(
                        context,
                        'Selectați  Operare',
                        operareId,
                        states1,
                        (onChangedVal) {
                          operareId = onChangedVal;
                          setState(() {
                            _selection = operareId;
                          });
                        },
                        (onValidate) {
                          return null;
                        },
                        borderColor: Colors.white,
                        borderFocusColor: Colors.white,
                        borderRadius: 8,
                        //paddingLeft: 85,
                        paddingRight: 10,
                        optionValue: 'Ido',
                        optionLabel: 'Nameso',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: buildTime(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    BoutonAction(
                      reponse: _selection != null && startispressed
                          ? startstopwatch
                          : null,
                      texte: 'START',
                      couleur: Colors.green,
                    ),
                    const SizedBox(height: 12),
                    BoutonAction(
                      reponse: pauseispressed ? null : pausestopwatch,
                      texte: 'PAUSE',
                      couleur: btncolor,
                    ),
                    const SizedBox(height: 12),
                    BoutonAction(
                      reponse: stopispressed ? null : stopstopwatch,
                      texte: 'STOP',
                      couleur: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTime() {
    final hours = swatch.elapsed.inHours.toString().padLeft(2, "0");
    final minutes = (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0");
    final seconds = (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.only(left: 30, bottom: 40),
            //margin: EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: controlispressed ? null : handleStartStop,
              icon: Icon(
                swatch.isRunning ? Icons.pause : Icons.play_arrow,
                size: 50,
                color: swatch.isRunning
                    ? Colors.orangeAccent
                    : Color.fromARGB(255, 52, 238, 52),
              ),
              //icon: Icon(swatch.isRunning ? Icons.pause : Icons.play_arrow )
            ),
          ),
        ),
        const SizedBox(width: 65),
        Row(
          children: [
            BuildTimeCard(time: hours, header: 'Ore'),
            const SizedBox(width: 10),
            BuildTimeCard(time: minutes, header: 'Minute'),
            const SizedBox(width: 10),
            BuildTimeCard(time: seconds, header: 'Secunde'),
          ],
        ),
      ],
    );
  }
}
