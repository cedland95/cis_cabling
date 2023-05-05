import 'package:flutter/material.dart';

import '../../couleurs/color.dart';

class ChampConnexion extends StatefulWidget {
  const ChampConnexion({Key? key}) : super(key: key);

  @override
  State<ChampConnexion> createState() => _ChampConnexionState();
}

class _ChampConnexionState extends State<ChampConnexion> {
  String login = '';
  String motDePass = '';
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       // const SizedBox(height: 30),
        Text("Login",
          style: TextStyle(
              fontSize:30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: textColor
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10,),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email/username ',
            labelStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: textColor,
            ),
            hintText: 'Enter your Email or username',
            hintStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              color: textColor2,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0)
            ),
            prefixIcon: const Icon(Icons.email),
              suffix: const InkWell(
                onTap: null,
                child: Icon(Icons.accessibility),
              )
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your email or username';
            }
            return null;
          },
          onChanged: (value) => login = value,
        ),
        const SizedBox(height: 20.0),


        TextFormField(
          controller: passController,
          decoration: InputDecoration(
              labelText: 'Parola ',
              labelStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                color: textColor,
              ),
              hintText: 'Enter your password',
              hintStyle: TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                color: textColor2,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              prefixIcon: const Icon(Icons.lock),
              suffix: InkWell(
                onTap: (){
                  setState(() {
                    passToggle = !passToggle;
                  });
                },
                child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
              )
          ),
          obscureText: passToggle,
          onChanged: (value) => motDePass = value,
          validator: (value) {
            if (value == null || value.length < 6) {
              return 'password incorect';
            }
            return null;
          },
        ),

      ],
    );
  }
}
