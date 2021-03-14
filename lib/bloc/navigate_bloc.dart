import 'package:background/pages/firstScreen.dart';
import 'package:background/pages/secondScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigateEvent { FirstScreen, SecondScreen }

abstract class NavigateState {}

class NavigateBloc extends Bloc<NavigateEvent, NavigateState> {
  NavigateBloc() : super(FirstScreen());

  @override
  Stream<NavigateState> mapEventToState(NavigateEvent event) async* {
    switch (event) {
      case NavigateEvent.FirstScreen:
        {
          yield FirstScreen();
          break;
        }
      case NavigateEvent.SecondScreen:
        {
          yield SecondScreen();
          break;
        }
    }
    // throw UnimplementedError();
  }
}
