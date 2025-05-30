part of 'block_bloc.dart';

sealed class BlockState extends Equatable {
  const BlockState();

  @override
  List<Object> get props => [];
}

class BlockInitial extends BlockState {}

class Blockloding extends BlockState {}

class Blocksucsecs extends BlockState {
  final Weather weather;
  final String cityName;

  const Blocksucsecs(this.weather, this.cityName);

  @override
  List<Object> get props => [weather, cityName];
}

class Blockeroor extends BlockState {}
