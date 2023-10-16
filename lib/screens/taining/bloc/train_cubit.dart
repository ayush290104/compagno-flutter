import 'package:bloc/bloc.dart';
import 'package:compagno4/core/class.dart';
import 'package:compagno4/main.dart';
import 'package:flutter/foundation.dart';

import 'train_state.dart';

class TrainCubit extends Cubit<TrainState> {
  List<TrainingClass>? trains;
  int currentTrains = 0;
  int currentVideo = 0;

  TrainCubit() : super(TrainInitialState());

  submitIfFinish(String videoId) {
    databaseRepo.submitVideo(videoId);
  }

  Videos nextVideo() {
    currentVideo+=1;
    return trains![currentTrains].videos[currentVideo];
  }

  int getLessonIndex() {
    debugPrint("current video is $currentVideo");
    return currentVideo ;
  }

  int getCurrentTrainTotalVideosLength(){
    return trains![currentTrains].videos.length;
  }

  int getTrainsNumber() => (trains ?? []).length;

  fetch(String tokenid) async {
    debugPrint("fetching...");
    emit(TrainLoadingState());
    trains = await databaseRepo.getTrainingData(tokenid);
    if (trains != null) {
      emit(TrainSuccessState());
      debugPrint("done...");
    } else {
      emit(TrainErrorState(massage: "error"));
    }
  }
}
