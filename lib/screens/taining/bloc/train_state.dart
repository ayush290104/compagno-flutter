abstract class TrainState {}

class TrainInitialState extends TrainState {}

class TrainLoadingState extends TrainState {}

class TrainSuccessState extends TrainState {}

class TrainErrorState extends TrainState {
  final String massage;
  TrainErrorState({required this.massage});
}
