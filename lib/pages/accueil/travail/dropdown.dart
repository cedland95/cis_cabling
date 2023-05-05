import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class DropdownAction extends StatelessWidget {
  const DropdownAction(this.optionval, this.optionlab,
      {Key? key,
      required this.nom,
      required this.state1,
      required this.state2,
      required this.change,
      required this.valide,})
      : super(key: key);
  final nom;
  final state1;
  final state2;
  final change;
  final valide;
  final optionval;
  final optionlab;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: FormHelper.dropDownWidget(
        context,
        'Selectați  Produs',
        state1,
        state2,
        (onChangedVal) => change,
        (onValidateVal) => valide,
        borderColor: Colors.white,
        borderFocusColor: Colors.white,
        borderRadius: 8,
        paddingLeft: 100,
        paddingRight: 1,
        optionValue: optionval,
        optionLabel: optionlab,
      ),
    );
  }
}
