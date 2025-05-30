part of 'block_bloc.dart';

sealed class BlockEvent extends Equatable {
  const BlockEvent();

  @override
  List<Object> get props => [];
}

class fetchweatherr extends BlockEvent {
  final Position position;

  const fetchweatherr(this.position);

  @override
  List<Object> get props => [position];
}
