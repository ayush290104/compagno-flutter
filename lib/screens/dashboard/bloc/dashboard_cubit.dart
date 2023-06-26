import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:compagno4/core/class.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardClass? dashboardClass;
  DashboardCubit() : super(DashboardInitialState());

  fetch() async {
    debugPrint("fetching...");
    emit(DashboardLoadingState());
    dashboardClass = await databaseRepo.getDashboardData();

    if (dashboardClass != null) {
      emit(DashboardSuccessState());
      debugPrint("done...");
    } else {
      emit(DashboardErrorState(massage: "error"));
    }
  }
}
