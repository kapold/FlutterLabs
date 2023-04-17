part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends CounterEvent {
  final int count;

  const IncrementEvent(this.count);

  @override
  List<Object> get props => [count];
}

class DecrementEvent extends CounterEvent {
  final int count;

  const DecrementEvent(this.count);

  @override
  List<Object> get props => [count];
}
