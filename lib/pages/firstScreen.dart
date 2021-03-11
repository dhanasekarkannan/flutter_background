import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
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
                  Navigator.of(context).pushNamed("SecondPage");
                })
          ],
        ));
  }
}
