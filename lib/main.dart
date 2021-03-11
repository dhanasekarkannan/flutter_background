import 'dart:async';

import 'package:background/pages/firstScreen.dart';
import 'package:background/pages/secondScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      routes: {
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        "FirstPage": (context) => FirstScreen(),
        "SecondPage": (context) => SecondScreen()
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final StreamController _streamController = StreamController();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print("dispose called");
    _streamController.close();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  AppLifecycleState _notification;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("State code : $state");
    if (state == AppLifecycleState.paused){
      setState(() {
        _notification = state;
      });
    }
  }

  Stream<int> checkLifeCycleEvent() async* {
    print("Stream called");

    if (_notification == AppLifecycleState.paused) {
      // Navigator.of(context).pushNamed('FirstPage');
      yield 1;
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: checkLifeCycleEvent(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error in stream");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          print("success snapshot : $snapshot");
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
        return FirstScreen();
      },
    );
  }
}
