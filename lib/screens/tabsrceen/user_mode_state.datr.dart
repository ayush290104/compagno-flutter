abstract class UserModelState{}

class UserInitialState extends UserModelState{}

class GetUserDataSuccessState extends UserModelState{}
class GetUserDataLoadingState extends UserModelState{}
class GetUserDataFailedState extends UserModelState{
  String error;
  GetUserDataFailedState({required this.error});
}