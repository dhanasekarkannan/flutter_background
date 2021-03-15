import 'package:background/bloc/navigate_bloc.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget with NavigateState {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Third Screen",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.blue,
            ),
          ),
        ),
        color: Colors.pink,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
