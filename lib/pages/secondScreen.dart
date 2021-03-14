import 'package:background/bloc/background_bloc.dart';
import 'package:background/bloc/navigate_bloc.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget with NavigateState{
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.amber,
          child: Center(
              child: Text(
            "SECOND SCREEN",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.indigo),
          ))),
    );
  }
}
