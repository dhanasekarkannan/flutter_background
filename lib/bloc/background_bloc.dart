import 'package:flutter_bloc/flutter_bloc.dart';

enum BackgroundEvent { LiveEvent, PauseEvent }

class BackgroundBloc extends Bloc<BackgroundEvent, bool> {
  BackgroundBloc() : super(false);

  @override
  Stream<bool> mapEventToState(BackgroundEvent event) async* {
    print("Event Clicked : $event");

    if (event == BackgroundEvent.PauseEvent) {
      yield true;
    } else {
      yield false;
    }
  }
}
