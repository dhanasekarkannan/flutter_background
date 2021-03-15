import 'dart:async';

import 'package:background/bloc/background_bloc.dart';
import 'package:background/bloc/navigate_bloc.dart';
import 'package:background/pages/firstScreen.dart';
import 'package:background/pages/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BackgroundBloc>(
          create: (context) => BackgroundBloc(),
        ),
        BlocProvider<NavigateBloc>(
          create: (context) => NavigateBloc(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("State code : $state");
    if (state == AppLifecycleState.paused) {
      BlocProvider.of<BackgroundBloc>(context).add(BackgroundEvent.PauseEvent);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackgroundBloc, bool>(
      builder: (BuildContext context, background) {
        print("Backgroud  enabled:$background ");
        return BlocBuilder<NavigateBloc, NavigateState>(
            builder: (BuildContext context, state) {
          print("state  enabled:$state & background: $background");
          if (background == true) {
            BlocProvider.of<NavigateBloc>(context)
                .add(NavigateEvent.FirstScreenEvent);
            BlocProvider.of<BackgroundBloc>(context)
                .add(BackgroundEvent.LiveEvent);
          }
          return state as Widget;
        });
      },
    );
  }
}
