import 'package:compagno4/Controller/dashboardController.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../../core/network/app_api.dart';
import '../../main.dart';
import '../../save_user/constants/constants.dart';
import '../../save_user/network/local_save.dart';
import 'bloc/dashboard_cubit.dart';
import 'bloc/dashboard_state.dart';

class DashboardMap extends StatefulWidget {
  const DashboardMap({Key? key}) : super(key: key);

  @override
  State<DashboardMap> createState() => _DashboardMapState();
}

class _DashboardMapState extends State<DashboardMap> {
  final List<LatLng> listLocations = [];
  final DashboardController dashboardController = Get.find();
  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: AppColors.k69806F,
      data: [0, 0.8, 0.4, 0.7, 0.6],
    ),

  ];
  final List<Feature> features1 = [
    Feature(
      title: "Drink Water",
      color: AppColors.k69806F,
      data: [0.8, 0.7, 0.4, 0.7, 0.6,0.9,0.7],
    ),
  ];

  Map<PolylineId, Polyline> polyLines = <PolylineId, Polyline>{};
  GoogleMapController? _controller;
  Set<Polyline> _createPolylines(List<LatLng> list) {
    final Set<Polyline> polylines = {};

    // Replace with your fixed coordinates
    final List<LatLng> coordinates = list;

    polylines.add(Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.blue,
      points: coordinates,
      width: 4, // Adjust the width as needed
    ));

    return polylines;
  }

  Future<CameraPosition> getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      LatLng userLocation = LatLng(position.latitude, position.longitude);

      // Create a CameraPosition with the obtained coordinates
      CameraPosition initialCameraPosition = CameraPosition(
        target: userLocation,
        zoom: 15, // You can adjust the initial zoom level
      );

      return initialCameraPosition;
    } catch (e) {
      // Handle any errors here
      print("Error: $e");

      return const CameraPosition(
        target: LatLng(0, 0),
        // Default to (0,0) if user location couldn't be determined
        zoom: 15, // You can adjust the initial zoom level
      );
    }
  }

  Future<Polyline> _getRoutePolyline({
    required LatLng start,
    required LatLng finish,
    required Color color,
    required String id,
    int width = 6,
  }) async {
    final polylinePoints = PolylinePoints();
    final List<LatLng> polylineCoordinates = [];
    final startPoint = PointLatLng(start.latitude, start.longitude);
    final finishPoint = PointLatLng(finish.latitude, finish.longitude);

    final result = await polylinePoints.getRouteBetweenCoordinates(
      AppApi.googleMapAPIKey,
      startPoint,
      finishPoint,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    }

    return Polyline(
      polylineId: PolylineId(id),
      consumeTapEvents: true,
      points: polylineCoordinates,
      color: color,
      width: width,
    );
  }

  getMultiplePolyLines() async {
    List<Polyline> polylines = [];

    for (int i = 1; i < listLocations.length; i++) {
      final polyline = await _getRoutePolyline(
        start: listLocations[i - 1],
        finish: listLocations[i],
        color: Colors.green,
        id: 'firstPolyline $i',
        width: 4,
      );
      polylines.add(polyline);
    }

    setState(() {
      polyLines.clear();
      for (int i = 0; i < polylines.length; i++) {
        polyLines[PolylineId('firstPolyline $i')] = polylines[i];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: dashboardCubit..fetch(SaveId.getSaveData(key: token)))
      ],
      child: Scaffold(
        backgroundColor: AppColors.k47574C,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding:
              const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Text(
                    "COMPAGNO",
                    style: k25_400_noize,
                  ),
                  const Spacer(),
                  Text(
                    "POWERED BY",
                    style: k10_400_bebas,
                  ),
                  Image.asset('assets/images/METALLO.png'),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            SizedBox(height:20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:26),
                  child: GestureDetector(
                   onTap: (){Navigator.pop(context);},   child: GestureDetector(
                    onTap: (){Navigator.pop(context);},
                    child: Image.asset("assets/images/back.png")),),
                ),

              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26,top: 6),
                  child: Text("YOUR ROUTE",style: k32_400_bebas,),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                      return Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width -2,
                                child: BlocBuilder<DashboardCubit, DashboardState>(
                                  builder: (context, state) {
                                    if (state is DashboardSuccessState) {
                                      if (dashboardCubit
                                          .dashboardClass?.data?.lastRide!.route !=
                                          null) {
                                        listLocations.clear();
                                        for (var i in dashboardCubit
                                            .dashboardClass!.data!.lastRide!.route!) {
                                          listLocations.add(LatLng(
                                              i.lat!.toDouble(), i.lng!.toDouble()));
                                          //debugPrint("listLocations at debug $listLocations");
                                        }
                                      }

                                      return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: (listLocations.isNotEmpty)
                                              ? SizedBox(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.4,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.7,
                                            child: ClipRRect(
                                              borderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(20)),
                                              child: GoogleMap(
                                                markers: <Marker>{
                                                  Marker(markerId: MarkerId('start destination'),position: listLocations[0]),
                                                  Marker(markerId: MarkerId('end destination'),position: listLocations[listLocations.length-1]),
                                                },
                                                polylines: _createPolylines(
                                                    listLocations),
                                                onMapCreated:
                                                    (GoogleMapController
                                                controller) {
                                                  _controller = controller;

                                                  // Zoom to the initial target position
                                                  controller.animateCamera(
                                                    CameraUpdate.newLatLngZoom(
                                                        listLocations[0],
                                                        15.0), // Adjust the zoom level as needed
                                                  );
                                                },
                                                myLocationEnabled: true,
                                                mapType: MapType.normal,
                                                initialCameraPosition:
                                                CameraPosition(
                                                    target:
                                                    listLocations[0]),
                                              ),
                                            ),
                                          )
                                              : const SizedBox(
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    "Sorry, we need more data to display it!",
                                                    style: TextStyle(
                                                        color: Colors.white))),
                                          ));
                                    } else {
                                      return Center(child: const CircularProgressIndicator());
                                    }
                                  },
                                )),
                          ],
                        ),
                      );
                    }),
              ],
            ),
            SizedBox(height: 27,),
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                if (state is DashboardSuccessState) {
                  if (dashboardCubit
                      .dashboardClass?.data?.lastRide!.route!=
                      null && listLocations.isNotEmpty) {
                    dashboardController.getAddressFromLatLng(listLocations[listLocations.length-1]);
                    //debugPrint("listLocations at debug $listLocations");
                  }

                  return Obx(() => Text(dashboardController.address.value,style: k13_400_roboto));
                } else {
                  return const SizedBox(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                            "Wait!",
                            style: TextStyle(
                                color: Colors.white))),
                  );
                }
              },
            ),
            SizedBox(height: 27,),
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                if (state is DashboardSuccessState) {
                  final List<String> elevationTimes = dashboardCubit.dashboardClass!.data!.lastRide!.elevation!.time!;

                  // Extract the first and last times
                  final String firstTime = elevationTimes.first;
                  final String lastTime = elevationTimes.last;

                  // Create a new list with the first and last times and empty strings for the rest
                  final List<String> labelX = [firstTime] + List.filled(elevationTimes.length - 2, "") + [lastTime];
                  final List<int> elevationData = dashboardCubit.dashboardClass!.data!.lastRide!.elevation!.elevation!;
                  final int minValue = elevationData.reduce((a, b) => a < b ? a : b); // Find the minimum
                  final int maxValue = elevationData.reduce((a, b) => a > b ? a : b); // Find the maximum

// Create a list of labels with the same length as the elevation data
                  final List<String> labelY = List.filled(elevationData.length, '');

// Set the labels for the minimum and maximum values
                  labelY[0] = '$minValue ft';
                  labelY[elevationData.length - 1] = '$maxValue ft';
                  return Container(height: 287,
                    width: 325,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16,left: 21),
                        child: Row(
                          children: [
                            Text("Elevation",style: k16_400_bebas,),
                          ],
                        ),
                      ),
                      LineGraph(
                        features: [

                          Feature(
                              title: "ELEVATION",
                              color: AppColors.kB69F4C,
                              data: fnToDouble2(dashboardCubit
                              .dashboardClass!.data!.lastRide!.elevation!.elevation!) )
                        ],
                        size: Size(244, 244),
                        labelX: labelX,
                        labelY: labelY,
                        //showDescription: true,
                        graphColor: Colors.white,
                        graphOpacity: 0.2,
                        verticalFeatureDirection: true,
                        // descriptionHeight: 100,
                      ),
                    ],),);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),

            SizedBox(height: 25,),
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                if (state is DashboardSuccessState) {


// Set the labels for the minimum and maximum values

                  return Container(height: 287,
                    width: 325,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16,left: 21),
                        child: Row(
                          children: [
                            Text("CHATTER SIZE",style: k16_400_bebas,),
                          ],
                        ),
                      ),
                      LineGraph(
                        features: [

                          Feature(
                              title: "CHATTER SIZE",
                              color: AppColors.kB69F4C,
                              data: fnToDouble3(dashboardCubit
                                  .dashboardClass!.data!.lastRide!.trailChatter!.data!) )
                        ],
                        size: Size(244, 244),
                        labelX: ["Small","Medium","Large"],
                        labelY: ["0.33","0.66","1"],
                        //showDescription: true,
                        graphColor: Colors.white,
                        graphOpacity: 0.2,
                        verticalFeatureDirection: true,
                        // descriptionHeight: 100,
                      ),
                    ],),);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],),
        ),
      ),
    );
  }
  List<double> fnToDouble2(List<int> ab) {
    List<double> hello = [];
    int maxNumber = ab.reduce((value, element) => value > element ? value : element);
    for (var a in ab) {
     hello.add((a.toDouble()/maxNumber.toDouble()));
    }

    return hello;
  }
  List<double> fnToDouble3(List<double> ab) {
    List<double> hello = [0.0,0.0,0.0];
var count = 0.0;
    for(var i in ab){
      count++;
      if(i<0.5){
         hello[0]++;
      }
      else if(i>0.5&&i<1){
        hello[1]++;
      }
      else{
        hello[2]++;
      }
    }


    debugPrint("hello is $hello");
    for (int index = 0; index < hello.length; index++) {
      hello[index] = hello[index] / count;
    }

    debugPrint("hello is $count");

    debugPrint("hello is $hello");

    return hello;

  }
}

