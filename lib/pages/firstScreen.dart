import 'package:background/bloc/navigate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatelessWidget with NavigateState{
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FIRST SCREEN",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.indigo),
            ),
            ElevatedButton(
                child: Text("Next Page"),
                onPressed: () {
                BlocProvider.of<NavigateBloc>(context).add(NavigateEvent.SecondScreen);
                
                })
          ],
        ));
  }
}
