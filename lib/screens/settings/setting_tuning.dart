import 'dart:io';

import 'package:compagno4/Bikes/bike_web.dart';
import 'package:compagno4/screens/tabsrceen/tabscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../../utils/useful.dart';
import 'controller/BikeController.dart';

class SettingTuning extends StatefulWidget {
  const SettingTuning({Key? key}) : super(key: key);

  @override
  State<SettingTuning> createState() => _SettingTuningScreenState();
}

class _SettingTuningScreenState extends State<SettingTuning> {

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
  BikeController bikeController = Get.find();
  File? image;

  void selectImage() async {
    image = await pickImageFromGallery(context);
    if (image != null) {
      bikeController.bikemodel.value.image = image!;
      debugPrint("${bikeController.bikemodel.value.image = image!}");
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

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
    bikeController.bikemodel.value.brand =
        bikeController.bikeselect.value.brand;
    bikeController.bikemodel.value.modelName =
        bikeController.bikeselect.value.modelName;
    front_shock_psi_Controller.text =
        bikeController.bikeselect.value.frontShockPsi ?? '';
    front_shock_sag_Controller.text =
        bikeController.bikeselect.value.frontShockSag ?? '';
    front_shock_hsc_Controller.text =
        bikeController.bikeselect.value.frontShockHsc ?? '';
    front_shock_lsc_Controller.text =
        bikeController.bikeselect.value.frontShockLsc ?? '';
    front_shock_hsr_Controller.text =
        bikeController.bikeselect.value.frontShockHsr ?? '';
    front_shock_lsr_Controller.text =
        bikeController.bikeselect.value.frontShockLsr ?? '';
    rear_shock_psi_Controller.text =
        bikeController.bikeselect.value.rearShockPsi ?? '';
    rear_shock_sag_Controller.text =
        bikeController.bikeselect.value.rearShockSag ?? '';
    rear_shock_hsc_Controller.text =
        bikeController.bikeselect.value.rearShockHsc ?? '';
    rear_shock_lsc_Controller.text =
        bikeController.bikeselect.value.rearShockLsc ?? '';
    rear_shock_hsr_Controller.text =
        bikeController.bikeselect.value.rearShockHsr ?? '';
    rear_shock_lsr_Controller.text =
        bikeController.bikeselect.value.rearShockLsr ?? '';
    front_tire_psi_Controller.text =
        bikeController.bikeselect.value.frontTirePsi?.toString() ?? '';
    rear_tire_psi_Controller.text =
        bikeController.bikeselect.value.rearTirePsi?.toString() ?? '';
    modelController.text =  bikeController.bikeselect.value.modelName;
    brandController.text = bikeController.bikeselect.value.brand;
    return Obx(() =>helllo());



  }
  Widget helllo(){
    if(bikeController.isloading.value){
      return const Scaffold(
          backgroundColor: AppColors.k47574C,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              ],
            )

        )
      );
    }
    else{
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
                        "Update YOUR BIKE",
                        style: k32_400_bebas,
                      ),
                      GestureDetector(
                        onTap: () async {

                          bikeController.bikemodelMap['brand'] = brandController.text.toString();
                          bikeController.bikemodelMap['model_name'] = modelController.text.toString();
                          bikeController.bikemodelMap['rear_tire_psi'] =
                              rear_tire_psi_Controller.text.toString();
                          bikeController.bikemodelMap['front_tire_psi'] =
                              front_tire_psi_Controller.text.toString();
                          bikeController.bikemodelMap['rear_shock_lsr'] =
                              rear_shock_lsr_Controller.text.toString();
                          bikeController.bikemodelMap['rear_shock_hsr'] =
                              rear_shock_hsr_Controller.text.toString();
                          bikeController.bikemodelMap['rear_shock_lsc'] =
                              rear_shock_lsc_Controller.text.toString();
                          bikeController.bikemodelMap['rear_shock_hsc'] =
                              rear_shock_hsc_Controller.text.toString();
                          bikeController.bikemodelMap['rear_shock_sag'] =
                              rear_shock_sag_Controller.text.toString();
                          bikeController.bikemodelMap['rear_shock_psi'] =
                              rear_shock_psi_Controller.text.toString();
                          bikeController.bikemodelMap['rear_shock_lsr'] =
                              rear_shock_lsr_Controller.text.toString();
                          bikeController.bikemodelMap['rear_shock_lsr'] =
                              rear_shock_lsr_Controller.text.toString();
                          bikeController.bikemodelMap['front_shock_hsr'] =
                              front_shock_hsr_Controller.text.toString();
                          bikeController.bikemodelMap['front_shock_lsc'] =
                              front_shock_lsc_Controller.text.toString();
                          bikeController.bikemodelMap['front_shock_hsc'] =
                              front_shock_hsc_Controller.text.toString();
                          bikeController.bikemodelMap['front_shock_sag'] =
                              front_shock_sag_Controller.text.toString();
                          bikeController.bikemodelMap['front_shock_psi'] =
                              front_shock_psi_Controller.text.toString();
                          bikeController.bikemodelMap['front_shock_lsr'] =
                              front_shock_lsr_Controller.text.toString();
                          debugPrint(bikeController.bikemodelMap.toString());
                          if(modelController.text!=""||brandController.text!=""){
                            await bikeController.Bikeupdate(image);
                            // await BikeWeb().updatebikemodel(
                            //     bikeController.bikeselect.value.id!,
                            //     bikeController.bikemodelMap,image);
                          }
                          else{
                            Get.snackbar("ALERT","Brand and Model name cant be empty");
                          }


                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabScreen(pageIndex: 3)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.k000000),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Update',
                                style: k10_700_roboto,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        child: (image == null)
                            ? (bikeController.bikeselect.value.image != "")
                            ? ClipOval(

                          child: Image.network(
                            "https://compagno.app${bikeController.bikeselect.value.image.toString().replaceFirst("/api/", "")}",

                            fit: BoxFit.cover,
                            // This ensures the image fills the circle
                            width: 60.3,
                            // Set the width and height to match the diameter of the CircleAvatar
                            height: 60.3,
                          ),
                        )
                            : Image.asset("assets/images/bike.png")
                            : Image.file(image!),
                      ),
                      Positioned(
                        bottom: -1,
                        right: -1,
                        child: InkWell(
                          onTap: selectImage,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.k000000,
                            ),
                            child: Center(
                              child: Image.asset("assets/images/edit.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Stack(
                  //   children: [
                  //     image == null
                  //         ?  CircleAvatar(
                  //       child: Image.network(
                  //         "https://compagno.app${bikeController.bikeselect.value
                  //             .image.toString()
                  //             .replaceFirst("/api/", "")}",
                  //
                  //
                  //       ),
                  //       backgroundColor: Colors.transparent,
                  //       radius: 30,
                  //     )
                  //         : CircleAvatar(
                  //
                  //       backgroundImage: FileImage(
                  //         image!,
                  //
                  //       ),
                  //       radius: 30,
                  //
                  //     ),
                  //     // Positioned(
                  //     //   bottom: -10,
                  //     //   left: 80,
                  //     //   child: IconButton(
                  //     //     onPressed: selectImage,
                  //     //     icon: const Icon(
                  //     //       Icons.add_a_photo,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  title: TextFormField(
                    controller: brandController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },

                    style: k13_400_roboto,
                    decoration: InputDecoration(
                      hintText: 'Brand name',
                      hintStyle: k13_400_roboto, // Set the hint text color
                    ),
                  ),

                  subtitle: TextFormField(
                    controller: modelController,
                    validator: (value){
                      if (value!=null&&value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Model name',
                      hintStyle: k13_400_roboto, // Set the hint text color
                    ),
                    style: k13_400_roboto,
                  ),
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .frontShockPsi = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .frontShockSag = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .frontShockHsc = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .frontShockLsc = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .frontShockHsr = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .frontShockLsr = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .rearShockPsi = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .rearShockSag = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .rearShockHsc = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .rearShockLsc = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .rearShockHsr = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                        onChanged: (value) {
                                          bikeController.bikemodel.value
                                              .rearShockLsr = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter the value",
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
                                          onChanged: (value) {
                                            bikeController.bikemodel.value
                                                .frontTirePsi = int.parse(value);
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Enter the value",
                                              hintStyle: k13_400_roboto)),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: TextFormField(
                                          controller: rear_tire_psi_Controller,
                                          onChanged: (value) {
                                            bikeController.bikemodel.value
                                                .rearTirePsi = int.parse(value);
                                          },
                                          keyboardType: TextInputType.number,
                                          style: k13_400_roboto,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Enter the value",
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
}
