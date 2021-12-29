import 'package:flutter/material.dart';



class passwordw extends StatefulWidget {
  const passwordw({Key? key}) : super(key: key);

  @override
  State<passwordw> createState() => _passwordwState();
}

class _passwordwState extends State<passwordw> {
bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(),
      ),
    );
  }
}