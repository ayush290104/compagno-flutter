abstract class UserModelState{}

class UserInitialState extends UserModelState{}
class UpdateUserDataLoadingState extends UserModelState{}
class UpdateUserDataSuccessState extends UserModelState{}
class UpdateUserDataFailedState extends UserModelState{
  String error;
  UpdateUserDataFailedState({required this.error});
}

class GetUserDataSuccessState extends UserModelState{}
class GetUserDataLoadingState extends UserModelState{}
class GetUserDataFailedState extends UserModelState{
  String error;
  GetUserDataFailedState({required this.error});




}