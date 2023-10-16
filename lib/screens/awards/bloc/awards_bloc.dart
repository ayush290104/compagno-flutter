import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:compagno4/core/class.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'awards_state.dart';

class AwardsCubit extends Cubit<AwardsState> {
  AwardsClass? award;
  AwardsCubit() : super(AwardsInitialState());

  fetch(String tokenid) async {
    debugPrint("fetching...");
    emit(AwardsLoadingState());
    award = await databaseRepo.getAward(tokenid);

    if (award != null) {
      emit(AwardsSuccessState());
      debugPrint("done...");
    } else {
      emit(AwardsErrorState(massage: "error"));
    }
  }
}
