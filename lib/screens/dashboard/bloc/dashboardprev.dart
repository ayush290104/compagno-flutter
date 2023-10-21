import 'dart:async';

import 'package:compagno4/core/network/app_api.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/save_user/constants/constants.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:compagno4/screens/dashboard/bloc/dashboard_state.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Controller/dashboardController.dart';
import '../../../constant/color.dart';
import '../../../constant/fonts.dart';
import '../../tabsrceen/user_mode_state.datr.dart';
import '../../tabsrceen/user_model_cubit.dart';

class Dashboard2 extends StatefulWidget {
  final int myInteger;

  Dashboard2({Key? key, required this.myInteger}) : super(key: key);

  @override
  State<Dashboard2> createState() => _DashboardState(myInteger: myInteger);
}

class _DashboardState extends State<Dashboard2> {
  final int myInteger;

  _DashboardState({required this.myInteger});

  final DashboardController dashboardController = Get.find();
  final List<LatLng> listLocations = [];
  final List<String> trailXAxis = [];
  final List<String> trailYAxis = [];
  final List<String> speedYAxis = [];
  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: AppColors.kB69F4C,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
  ];

  Map<PolylineId, Polyline> polyLines = <PolylineId, Polyline>{};
  GoogleMapController? _controller;

  //final CameraPosition _kGooglePlex = ;
  @override
  void initState() {
    super.initState();
  }

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

    trailXAxis.clear();
    trailYAxis.clear();
    speedYAxis.clear();
    listLocations.clear();

    // Process trailChatter distance
    if (dashboardCubit.dashboardClass?.data?.previousRide![myInteger]!
            .trailChatter?.distance !=
        null) {
      for (var i in dashboardCubit.dashboardClass!.data!
          .previousRide![myInteger].trailChatter!.distance!) {
        List<String> timeComponents = i.split(':');
        String hrMin = '${timeComponents[0]}:${timeComponents[1]}';
        trailXAxis.add(hrMin);
      }
    }

    // Calculate X values
    String firstXValue = trailXAxis.isNotEmpty ? trailXAxis.first : '';
    String middleXValue =
        trailXAxis.length > 2 ? trailXAxis[trailXAxis.length ~/ 2] : '';
    String lastXValue = trailXAxis.isNotEmpty ? trailXAxis.last : '';

    // Process trailChatter data
    if (dashboardCubit.dashboardClass?.data?.previousRide![myInteger]!
            .trailChatter?.data !=
        null) {
      for (var i in dashboardCubit
          .dashboardClass!.data!.previousRide![myInteger].trailChatter!.data!) {
        trailYAxis.add(i.toString());
      }
    }

    // Calculate Y values
    String firstYValue = trailYAxis.isNotEmpty ? trailYAxis.first : '';
    String middleYValue =
        trailYAxis.length > 2 ? trailYAxis[trailYAxis.length ~/ 2] : '';
    String lastYValue = trailYAxis.isNotEmpty ? trailYAxis.last : '';

    // Process trailChatter data
    if (dashboardCubit
            .dashboardClass?.data?.previousRide![myInteger]!.speed?.speed !=
        null) {
      for (var i in dashboardCubit
          .dashboardClass!.data!.previousRide![myInteger].speed!.speed!) {
        speedYAxis.add(i.toString());
      }
    }

    // Calculate Y values
    String sYValue = speedYAxis.isNotEmpty ? speedYAxis.first : '';
    String sMYValue =
        speedYAxis.length > 2 ? speedYAxis[speedYAxis.length ~/ 2] : '';
    String sLYValue = speedYAxis.isNotEmpty ? speedYAxis.last : '';

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: dashboardCubit..fetch(SaveId.getSaveData(key: token))),
        BlocProvider.value(
            value: UserModelCubit()..getUserData())

      ],
      child: Scaffold(
        backgroundColor: AppColors.k47574C,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
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
                const SizedBox(
                  height: 35,
                ),
                BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                  return Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            (state is DashboardSuccessState)
                                ? "WELCOME, ${dashboardCubit.dashboardClass!.data!.user!.name!.toUpperCase()}"
                                : "WAIT...",
                            style: k28_400_noize,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Let’s amplify your ride experience.",
                  style: k13_400_roboto,
                ),
                const SizedBox(
                  height: 14,
                ),
                BlocBuilder<UserModelCubit, UserModelState>(builder: (context, state){
                  final cubit = BlocProvider.of<UserModelCubit>(context);
                  return CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60,
                    child:(cubit.userData != null)? (cubit.userData!.profile_pic.toString().isNotEmpty)
                        ? ClipOval(
                      child: Image.network(
                        "https://compagno.app${cubit.userData!.profile_pic.toString().replaceFirst("/api/", "")}",
                        fit: BoxFit.cover, // This ensures the image fills the circle
                        width: 120, // Set the width and height to match the diameter of the CircleAvatar
                        height: 120,
                      ),
                    )
                        : Image.asset("assets/images/user.png"):CircularProgressIndicator(color: Colors.white,),
                  );
                }),
                const SizedBox(
                  height: 39,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Row(
                    children: [
                      Text(
                        "YOUR PREVIOUS RIDE",
                        style: k20_400_bebas,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9, left: 26),
                  child: Row(
                    children: [
                      Image.asset("assets/images/location.png"),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: BlocBuilder<DashboardCubit, DashboardState>(
                          builder: (context, state) {
                            if (state is DashboardSuccessState) {
                              if (dashboardCubit.dashboardClass?.data
                                          ?.previousRide![myInteger]!.route !=
                                      null &&
                                  listLocations.isNotEmpty) {
                                dashboardController.getAddressFromLatLng(
                                    listLocations[listLocations.length - 1]);
                                //debugPrint("listLocations at debug $listLocations");
                              }

                              return Obx(() => Text(
                                  dashboardController.address.value,
                                  style: k13_400_roboto));
                            } else {
                              return const SizedBox(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Wait!",
                                        style: TextStyle(color: Colors.white))),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 8 * 3,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.k000000),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const TrailChatter()));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 23, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Text(
                                      "Trail Chatter",
                                      style: k16_400_bebas,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                      child: Image.asset(
                                          "assets/images/iconsforword.png"))
                                ],
                              ),
                            ),
                            BlocBuilder<DashboardCubit, DashboardState>(
                                builder: (context, state) {
                              if ((state is DashboardSuccessState)) {
                                return (dashboardCubit
                                            .dashboardClass!
                                            .data!
                                            .previousRide![myInteger]
                                            .trailChatter!
                                            .data!
                                            .length >
                                        1)
                                    ? LineGraph(
                                        features: [
                                          Feature(
                                            title: "TRAIL CHATTER",
                                            color: AppColors.kB69F4C,
                                            data: fnToDouble2(dashboardCubit
                                                .dashboardClass!
                                                .data!
                                                .previousRide![myInteger]
                                                .trailChatter!
                                                .data!),
                                          )
                                        ],
                                        size: Size(
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                8 * 3,
                                            100),
                                        labelX: [
                                          firstXValue,
                                          middleXValue,
                                          lastXValue
                                        ],

                                        labelY: ["1", "2", "3"],
                                        //showDescription: true,
                                        graphColor: Colors.white,
                                        graphOpacity: 0.2,
                                        verticalFeatureDirection: true,
                                        // descriptionHeight: 100,
                                      )
                                    : SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                8 * 5,
                                        height: 100,
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "Sorry, we need more data to display it!",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ));
                              } else {
                                return SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            8 * 6,
                                    height: 100,
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text("WAIT...",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ));
                              }
                            }),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 8 * 3,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.k000000,
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const SpeedGraph()),
                          // );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 23),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Text(
                                      "Speed",
                                      style: k16_400_bebas,
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                        "assets/images/iconsforword.png"),
                                  )
                                ],
                              ),
                            ),
                            BlocBuilder<DashboardCubit, DashboardState>(
                              builder: (context, state) {
                                if (state is! DashboardSuccessState) {
                                  return SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            8 * 5,
                                    height: 100,
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "WAIT...",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  );
                                }

                                if (dashboardCubit
                                        .dashboardClass!
                                        .data!
                                        .previousRide![myInteger]
                                        .speed!
                                        .speed!
                                        .length >
                                    1) {
                                  return SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            8 * 5,
                                    height: 100,
                                    child: (fnToDouble(dashboardCubit
                                                    .dashboardClass!
                                                    .data!
                                                    .previousRide![myInteger]!
                                                    .speed!
                                                    .speed!)
                                                .length) !=
                                            0
                                        ? LineGraph(
                                            features: [
                                              Feature(
                                                title: "speed",
                                                color: AppColors.kB69F4C,
                                                data: fnToDouble(dashboardCubit
                                                    .dashboardClass!
                                                    .data!
                                                    .previousRide![myInteger]!
                                                    .speed!
                                                    .speed!),
                                              )
                                            ],
                                            size: Size(
                                              MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  8 * 5,
                                              100,
                                            ),
                                            labelX: [
                                              firstXValue,
                                              middleXValue,
                                              lastXValue
                                            ],
                                            labelY: const ["10", "25", "45"],
                                            graphColor: Colors.white,
                                            graphOpacity: 0.2,
                                            verticalFeatureDirection: true,
                                          )
                                        : LineGraph(
                                            features: [
                                              Feature(
                                                title: "speed",
                                                color: AppColors.kB69F4C,
                                                data: [0.0, 0.0, 0.0],
                                              )
                                            ],
                                            size: Size(
                                              MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  8 * 5,
                                              100,
                                            ),
                                            labelX: [
                                              firstXValue,
                                              middleXValue,
                                              lastXValue
                                            ],
                                            labelY: const ["10", "25", "45"],
                                            graphColor: Colors.white,
                                            graphOpacity: 0.2,
                                            verticalFeatureDirection: true,
                                          ),
                                  );
                                }
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      8 * 5,
                                  height: 100,
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sorry, we need more data to display it!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 8 * 3,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.k000000),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 23),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    "Total time",
                                    style: k16_400_bebas,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                      "assets/images/iconsforword.png"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                              dashboardCubit.dashboardClass?.data!
                                      .previousRide![myInteger].totalTime! ??
                                  "0:00:00",
                              style: k30_400_bebas),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const DashboardMap()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 34),
                    child: Row(
                      children: [
                        Text(
                          "YOUR ROUTE",
                          style: k20_400_bebas,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                  return Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: BlocBuilder<DashboardCubit, DashboardState>(
                              builder: (context, state) {
                                if (state is DashboardSuccessState) {
                                  if (dashboardCubit.dashboardClass?.data
                                          ?.previousRide![myInteger]!.route !=
                                      null) {
                                    listLocations.clear();
                                    for (var i in dashboardCubit
                                        .dashboardClass!
                                        .data!
                                        .previousRide![myInteger]!
                                        .route!) {
                                      listLocations.add(LatLng(
                                          i.lat!.toDouble(),
                                          i.lng!.toDouble()));
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
                                                  0.8,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                child: GoogleMap(
                                                  markers: <Marker>{
                                                    Marker(
                                                        markerId: MarkerId(
                                                            'start destination'),
                                                        position:
                                                            listLocations[0]),
                                                    Marker(
                                                        markerId: MarkerId(
                                                            'end destination'),
                                                        position: listLocations[
                                                            listLocations
                                                                    .length -
                                                                1]),
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
                                                          color:
                                                              Colors.white))),
                                            ));
                                } else {
                                  return Align(
                                      alignment: Alignment.center,
                                      child: const Text("Waiting", style: TextStyle(color: Colors.white),));
                                }
                              },
                            )),
                      ],
                    ),
                  );
                }),

                // Image.asset("assets/images/mapimage.png"),
                const SizedBox(
                  height: 40,
                ),

                const SizedBox(
                  height: 16,
                ),

                const SizedBox(height: 54),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<double> fnToDouble(List<int> ab) {
    List<double> hello = [];
    // hello.add(ab[0].toDouble());
    // hello.add(ab[ab.length~/2].toDouble());
    // hello.add(ab[ab.length-1].toDouble());
    for (var a in ab) {
      if (hello.length == 3) {
        break;
      }
      if (a != 0) {
        hello.add(a.toDouble() / 45);
      }
    }
    debugPrint("list is $hello");
    return hello;
  }

  List<LatLng> fntoLatLng(List<num> ab) {
    List<LatLng> hello = [];
    for (var a in ab) {}
    return hello;
  }

  List<double> fnToDouble2(List<num> ab) {
    List<double> hello = [];
    for (var a in ab) {
      if (hello.length == 3) {
        break;
      }
      if (a != 0) {
        hello.add(a.toDouble() / 3);
      }
    }

    return hello;
  }
}

