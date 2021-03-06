import 'package:background/pages/firstScreen.dart';
import 'package:background/pages/secondScreen.dart';
import 'package:background/pages/thirdScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigateEvent { FirstScreenEvent, SecondScreenEvent, ThirdScreenEvent }

abstract class NavigateState {}

class NavigateBloc extends Bloc<NavigateEvent, NavigateState> {
  NavigateBloc() : super(FirstScreen());

  @override
  Stream<NavigateState> mapEventToState(NavigateEvent event) async* {
    switch (event) {
      case NavigateEvent.FirstScreenEvent:
        {
          yield FirstScreen();
          break;
        }
      case NavigateEvent.SecondScreenEvent:
        {
          yield SecondScreen();
          break;
        }
      case NavigateEvent.ThirdScreenEvent:
        {
          yield ThirdScreen();
          break;
        }
    }
  }
}
