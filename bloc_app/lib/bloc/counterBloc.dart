import 'package:bloc_app/bloc/counterEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDerementPressed>((event, emit) => emit(state - 1));
  }
}
