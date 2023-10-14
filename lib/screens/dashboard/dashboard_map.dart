import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
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
                                          .dashboardClass?.data?.yourRoute !=
                                          null) {
                                        listLocations.clear();
                                        for (var i in dashboardCubit
                                            .dashboardClass!.data!.yourRoute!) {
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
                                      return const Text("Waiting");
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
            Text("McDowell Mountain Loop, Phoenix, AZ",style: k13_400_roboto,),
            SizedBox(height: 27,),
            Container(height: 287,
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
                  features: features,
                  size: Size(175, 244),
                  labelX: ['0', '2', '4', '6','8'],
                  labelY: ['1548ft', '', '', '1781ft',],
                  //showDescription: true,
                  graphColor: Colors.white,
                  graphOpacity: 0.2,
                  verticalFeatureDirection: true,
                  // descriptionHeight: 100,
                ),
              ],),),
            SizedBox(height: 25,),
            Container(height: 287,
              width: 325,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.k000000),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16,left: 21),
                  child: Row(
                    children: [
                      Text("Chatter size",style: k16_400_bebas,),
                    ],
                  ),
                ),
                LineGraph(
                  features: features1,
                  size: Size(175, 244),
                  labelX: ['0', '2', '4', '6','8'],
                  labelY: ['small', 'medium', 'large',],
                  //showDescription: true,
                  graphColor: Colors.white,
                  //graphOpacity: 0.4,
                  verticalFeatureDirection: true,
                  // descriptionHeight: 100,
                ),
              ],),),
          ],),
        ),
      ),
    );
  }
}

