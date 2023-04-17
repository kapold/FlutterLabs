import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterLoaded(0));

  @override
  Stream<CounterState> mapEventToState(
      CounterEvent event,
      ) async* {
    if (event is IncrementEvent) {
      yield CounterLoaded(event.count + 1);
    } else if (event is DecrementEvent) {
      yield CounterLoaded(event.count - 1);
    }
  }
}
