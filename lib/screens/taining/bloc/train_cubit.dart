import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:compagno4/core/class.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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
    return trains![currentTrains].videos[currentVideo + 1];
  }

  int getLessonIndex() {
    return currentVideo + 1;
  }

  int getTrainsNumber() => (trains ?? []).length;

  fetch() async {
    debugPrint("fetching...");
    emit(TrainLoadingState());
    trains = await databaseRepo.getTraininigData();

    if (trains != null) {
      emit(TrainSuccessState());
      debugPrint("done...");
    } else {
      emit(TrainErrorState(massage: "error"));
    }
  }
}
