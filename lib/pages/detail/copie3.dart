import 'package:cis_cablings_app/pages/couleurs/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../accueil/travail/widgets/buidtime_total.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Activity();
  }
}

class _Activity extends State<Activity> {
  TextEditingController dateInput = TextEditingController();
  final List<Map<String, dynamic>> _allActivity = [
    {
      "id": 1,
      "produs": "CO-01",
      "operare": "CO-001",
      "date": DateFormat('dd/MM/yyyy').format(DateTime.now()),
      "durata": DateFormat.Hms().format(DateTime.now()),
      "pourcentage": "24%"
    },
    {
      "id": 2,
      "produs": "CO-02",
      "operare": "CO-002",
      "date": DateFormat('dd/MM/yyyy').format(DateTime.now()),
      "durata": DateFormat.Hms().format(DateTime.now()),
      "pourcentage": "26%"
    },
    {
      "id": 3,
      "produs": "CO-03",
      "operare": "CO-003",
      "date": DateFormat('dd/MM/yyyy').format(DateTime.now()),
      "durata": DateFormat.Hms().format(DateTime.now()),
      "pourcentage": "25%"
    },
    {
      "id": 4,
      "produs": "CO-04",
      "operare": "CO-004",
      "date": DateFormat('dd/MM/yyyy').format(DateTime.now()),
      "durata": DateFormat.Hms().format(DateTime.now()),
      "pourcentage": "25%"
    },
    {
      "id": 5,
      "produs": "CO-04",
      "operare": "CO-004",
      "date": DateFormat('dd/MM/yyyy').format(DateTime.now()),
      "durata": DateFormat.Hms().format(DateTime.now()),
      "pourcentage": "25%"
    },
  ];

  List<Map<String, dynamic>> _foundActivity = [];

  @override
  void initState() {
    _foundActivity = _allActivity;
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment(-0.99, 0),
                    child: Text(
                      "Data",
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: dateInput,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      prefixIcon: const Icon(Icons.calendar_today),
                      //filled: true,
                      fillColor: Colors.white,
                    ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime.now());

                      if (pickedDate != null) {
                        String formattedDate = DateFormat('dd/MM/yy').format(pickedDate);
                        setState(() {
                          dateInput.text = formattedDate;
                        });
                      } else {}
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _foundActivity.length,
                        itemBuilder: (context, index) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  _foundActivity[index]["date"],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                              Container(
                                key:
                                ValueKey(_foundActivity[index]["date"]),
                                //margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'PRODUS: ${_foundActivity[index]["produs"].toString()}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: textColor2,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Text(
                                            'OPERARE: ${_foundActivity[index]["operare"].toString()}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: textColor2,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Text(
                                            'DURATA: ${_foundActivity[index]["durata"].toString()}',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: textColor2,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 15, top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            ' ${_foundActivity[index]["pourcentage"].toString()}',
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: textColor,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.zero,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8.0),
                                  ),
                                  color: Colors.blue,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Center(
                                      child: BuilTimeTotal(
                                          hours: "00",
                                          minutes: "00",
                                          seconds: "00"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
