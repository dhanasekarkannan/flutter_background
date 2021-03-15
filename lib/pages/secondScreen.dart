import 'package:background/bloc/navigate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget with NavigateState {
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
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SECOND SCREEN",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.indigo),
              ),
              OutlinedButton(
                  child: Text("Third Screen"),
                  onPressed: () {
                    BlocProvider.of<NavigateBloc>(context)
                        .add(NavigateEvent.ThirdScreenEvent);
                  })
            ],
          ))),
    );
  }
}
