import 'dart:io';

import 'package:compagno4/screens/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../../utils/useful.dart';

class AddBikesScreen extends StatefulWidget {
  const AddBikesScreen({Key? key}) : super(key: key);

  @override
  State<AddBikesScreen> createState() => _AddBikesScreenState();
}

class _AddBikesScreenState extends State<AddBikesScreen> {
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController front_shock_psi_Controller = TextEditingController();
  TextEditingController front_shock_sag_Controller = TextEditingController();
  TextEditingController front_shock_hsc_Controller = TextEditingController();
  TextEditingController front_shock_lsc_Controller = TextEditingController();
  TextEditingController front_shock_hsr_Controller = TextEditingController();
  TextEditingController front_shock_lsr_Controller = TextEditingController();
  TextEditingController rear_shock_psi_Controller = TextEditingController();
  TextEditingController rear_shock_sag_Controller = TextEditingController();
  TextEditingController rear_shock_hsc_Controller = TextEditingController();
  TextEditingController rear_shock_lsc_Controller = TextEditingController();
  TextEditingController rear_shock_hsr_Controller = TextEditingController();
  TextEditingController rear_shock_lsr_Controller = TextEditingController();
  TextEditingController front_tire_psi_Controller = TextEditingController();
  TextEditingController rear_tire_psi_Controller = TextEditingController();

  File? image;


  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    brandController.dispose();
    modelController.dispose();
    front_shock_psi_Controller.dispose();
    front_shock_sag_Controller.dispose();
    front_shock_hsc_Controller.dispose();
    front_shock_lsc_Controller.dispose();
    front_shock_hsr_Controller.dispose();
    front_shock_lsr_Controller.dispose();
    rear_shock_psi_Controller.dispose();
    rear_shock_sag_Controller.dispose();
    rear_shock_hsc_Controller.dispose();
    rear_shock_lsc_Controller.dispose();
    rear_shock_hsr_Controller.dispose();
    rear_shock_lsr_Controller.dispose();
    front_tire_psi_Controller.dispose();
    rear_tire_psi_Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ADD YOUR BIKE",
                      style: k32_400_bebas,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.k000000),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ADD',
                            style: k10_700_roboto,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Settings()));
                            },
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: Image.asset("assets/images/edit2.png"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading:GestureDetector(
                  onTap: selectImage,
                  child: Stack(
                    children: [
                      image == null
                          ? const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/bikeimg.png"),
                        radius: 30,
                      )
                          : CircleAvatar(
                        backgroundImage: FileImage(
                          image!,
                        ),
                        radius: 30,
                      ),
                      // Positioned(
                      //   bottom: -10,
                      //   left: 80,
                      //   child: IconButton(
                      //     onPressed: selectImage,
                      //     icon: const Icon(
                      //       Icons.add_a_photo,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                title: TextField(
                    controller: brandController,
                    style: k13_400_roboto,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Brand name",
                        hintStyle: k13_400_roboto)),
                subtitle: TextField(
                    controller: modelController,
                    style: k13_400_roboto,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Model name",
                        hintStyle: k13_400_roboto)),
              ),
              const SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.k000000),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 14, left: 20, right: 9),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "FRONT SHOCK",
                                style: k20_400_bebas,
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  // Handle Rider Level edit action
                                },
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset("assets/images/edit2.png"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: front_shock_psi_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "PSI",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: front_shock_sag_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Sag %",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: front_shock_hsc_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Compression, HSC",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: front_shock_lsc_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Compression, LSC",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: front_shock_hsr_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Rebound, HSR",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: front_shock_lsr_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Rebound, LSR",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       flex:1,
                          //       child: Column(
                          //         children: [
                          //
                          //           SizedBox(
                          //             height: 5,
                          //           ),
                          //
                          //           SizedBox(
                          //             height: 5,
                          //           ),
                          //
                          //           SizedBox(
                          //             height: 5,
                          //           ),
                          //
                          //           SizedBox(
                          //             height: 5,
                          //           ),
                          //
                          //           SizedBox(
                          //             height: 5,
                          //           ),
                          //
                          //         ],
                          //       ),
                          //     ),
                          //     // SizedBox(
                          //     //   width: 22,
                          //     // ),
                          //     Container(
                          //       height: 260,
                          //       width: 1,
                          //       color: Colors.white,
                          //     ),
                          //     Expanded(
                          //       flex: 1,
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //
                          //           SizedBox(
                          //             height: 30,
                          //           ),
                          //
                          //           SizedBox(
                          //             height: 30,
                          //           ),
                          //
                          //           SizedBox(
                          //             height: 30,
                          //           ),
                          //
                          //           SizedBox(
                          //             height: 30,
                          //           ),
                          //
                          //           SizedBox(
                          //             height: 30,
                          //           ),
                          //
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // )
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.k000000),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 14, left: 20, right: 9),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "REAR SHOCK",
                                style: k20_400_bebas,
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  // Handle Rider Level edit action
                                },
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset("assets/images/edit2.png"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: rear_shock_psi_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "PSI",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: rear_shock_sag_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Sag %",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: rear_shock_hsc_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Compression, HSC",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: rear_shock_lsc_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Compression, LSC",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: rear_shock_hsr_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Rebound, HSR",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: TextFormField(
                                      controller: rear_shock_lsr_Controller,
                                      style: k13_400_roboto,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "??",
                                          hintStyle: k13_400_roboto)),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    "Rebound, LSR",
                                    style: k13_400_roboto,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 325,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.k000000,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14, left: 20, right: 9),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Tire Pressure", style: k20_400_bebas),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                // Handle Tire Pressure edit action
                              },
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset("assets/images/edit2.png"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: TextFormField(
                                        controller: front_tire_psi_Controller,
                                        style: k13_400_roboto,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "??",
                                            hintStyle: k13_400_roboto)),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: TextFormField(
                                        controller: rear_tire_psi_Controller,
                                        style: k13_400_roboto,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "??",
                                            hintStyle: k13_400_roboto)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 22),
                            Container(
                              height: 150,
                              width: 1,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22),
                                    child: Text("PSI", style: k13_400_roboto),
                                  ),
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22),
                                    child: Text("Sag %", style: k13_400_roboto),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
