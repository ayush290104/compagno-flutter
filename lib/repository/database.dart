import 'dart:convert';

import 'package:compagno4/core/class.dart';
import 'package:compagno4/screens/dashboard/home_page_response_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class DatabaseRepo {
  String? token;

  void submitVideo(String videoID) async {
    var url = Uri.parse("https://compagno.app/api/training/$videoID");
    http.post(url, headers: {
      'Authorization': "Bearer $token",
    });
  }

  Future<AwardsClass?> getAward() async {
    var url = Uri.parse("https://compagno.app/api/users/awards");
    try {
      var response = await http.get(url, headers: {
        'Authorization': "Bearer $token",
      });
      if (response.statusCode != 200) {
        return null;
      } else {
        dynamic data = jsonDecode(response.body)["data"];

        return AwardsClass(
            awardsProgress: [
              for (Map json in data["awards_progress"])
                AwardsProgress(
                  id: json['id'],
                  userId: json['user_id'],
                  awardId: json['award_id'],
                  progressCount: json['progress_count'],
                  completeCount: json['complete_count'],
                  isCompleted: json['is_completed'],
                  createdAt: json['created_at'],
                  updatedAt: json['updated_at'],
                  title: json['title'],
                  icon: json['icon'],
                  completionType: json['completion_type'],
                  sessionCount: json['session_count'],
                  rideCount: json['ride_count'],
                ),
            ],
            completedAwards: [],
            lifeTime: LifeTime(
                ridesCompleted: data["life_time"]['rides_completed'] ?? 0,
                sessionsCompleted:
                    data["life_time"]['sessions__completed'] ?? 0),
            compagnoRewards: []);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }

  Future<List<TrainingClass>> getTraininigData() async {
    var url = Uri.parse("https://compagno.app/api/training");
    try {
      var response = await http.get(url, headers: {
        'Authorization': "Bearer $token",
      });
      if (response.statusCode != 200) {
        return [];
      } else {
        dynamic data = jsonDecode(response.body)["data"]["training"];
        List<TrainingClass> trainings = [];
        for (Map item in data) {
          trainings.add(TrainingClass(
              id: item['id'],
              title: item['title'],
              createdAt: item['created_at'],
              updatedAt: item['updated_at'],
              videos: [
                for (Map v in item["videos"] ?? [])
                  Videos(
                    id: v['id'],
                    title: v['title'],
                    subTitle: v['sub_title'],
                    url: v['url'],
                    thumbnail: v['thumbnail'] ?? '',
                    point: v['point'],
                    videoSession: v['video_session'],
                    trainingSteps: v['training_steps'],
                    createdAt: v['created_at'],
                    updatedAt: v['updated_at'],
                  )
              ]));
          return trainings;
        }
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
    return [];
  }
  Future<String> getAddressFromLatLng(LatLng location) async {
    final apiKey = 'YOUR_GOOGLE_MAPS_API_KEY'; // Replace with your Google Maps API key
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
       return data['results'][0]['formatted_address'];
      } else {
       return 'Address not found';
      }
    } else {
     return 'Error retrieving address';
           }
  }

  Future<HomePageResponse?> getDashboardData(String tokenid) async {
    var url = Uri.parse("https://compagno.app/api/users/dashboard");
    try {
      var response = await http.get(url, headers: {
        'Authorization': "Bearer ${tokenid}",
      });

      print(response.statusCode.toString());
      if (response.statusCode != 200) {
        return null;
      } else{
        final data = jsonDecode(response.body);

        final parsedResponse = HomePageResponse.fromJson(data);
        return parsedResponse;
      }
    } catch (e) {
      print("erppr");
      print(e.toString());
      return null;
    }
  }
}
