abstract class AwardsState {}

class AwardsInitialState extends AwardsState {}

class AwardsLoadingState extends AwardsState {}

class AwardsSuccessState extends AwardsState {}

class AwardsErrorState extends AwardsState {
  final String massage;
  AwardsErrorState({required this.massage});
}
