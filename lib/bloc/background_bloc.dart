import 'package:background/pages/firstScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BackgroundEvent {
  live,
  background
}


class BackgroundBloc extends Bloc<BackgroundEvent,bool> {
  BackgroundBloc() : super(false);

  @override
  Stream<bool> mapEventToState(BackgroundEvent event) async*{
    if(event == BackgroundEvent.background){
      print("Event Clicked : $event");
      yield true;
    }
    // throw UnimplementedError(); 
  }
  
}