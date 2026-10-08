part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class AddState extends CounterState {}

final class RemoveState extends CounterState {}
