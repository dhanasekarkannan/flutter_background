import 'package:background/main.dart';
import 'package:flutter/material.dart';

class AppLifeCycleWidget extends StatefulWidget {
  final Widget child;

  const AppLifeCycleWidget({Key key, this.child}) : super(key: key);

  @override
  _AppLifeCycleWidgetState createState() => _AppLifeCycleWidgetState();
}

class _AppLifeCycleWidgetState extends State<AppLifeCycleWidget>
    with WidgetsBindingObserver {
  AppLifecycleState _state;
  @override
  void initState() {
    print("initState called");

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print("dispose called");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("State code : $state");

    if (state == AppLifecycleState.resumed) {
      setState(() {
        _state = state;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _state == AppLifecycleState.resumed
        ? MyHomePage(
            title: "homePage",
          )
        : widget.child;
  }
}
