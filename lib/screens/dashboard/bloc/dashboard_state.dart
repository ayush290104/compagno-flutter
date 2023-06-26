abstract class DashboardState {}

class DashboardInitialState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardSuccessState extends DashboardState {}

class DashboardErrorState extends DashboardState {
  final String massage;
  DashboardErrorState({required this.massage});
}
