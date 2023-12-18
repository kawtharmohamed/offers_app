import 'package:flutter_bloc/flutter_bloc.dart';

class MyBloc extends Bloc<myBlocEevent, myBlocState> {
  MyBloc() : super(myBlocState()); //constructor
  Stream<myBlocState> mapEventToState(myBlocEevent e) async* {
    if (e.type == "CLK") {
      yield myBlocState().reset();
    } else if (e.type == "+") {
      yield myBlocState().increment(state);
    } else if (e.type == "-") {
      yield myBlocState().decrement(state);
    }
  }
}

class myBlocEevent {
  String type = "CLK";
  myBlocEevent(this.type);
}

class myBlocState {
  int count = 0;
  myBlocState reset() {
    myBlocState x = new myBlocState();
    x.count = 0;
    return x;
  }

  myBlocState increment(myBlocState c) {
    myBlocState x = new myBlocState();
    x.count = c.count + 1;
    return x;
  }

  myBlocState decrement(myBlocState c) {
    myBlocState x = new myBlocState();
    x.count = c.count - 1;
    return x;
  }
}
