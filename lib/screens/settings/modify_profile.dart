import 'dart:io';

import 'package:compagno4/screens/settings/controller/modifycontroller.dart';
import 'package:compagno4/screens/tabsrceen/tabscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../../utils/useful.dart';
import '../tabsrceen/user_mode_state.datr.dart';
import '../tabsrceen/user_model_cubit.dart';

class ModifyProfile extends StatefulWidget {
  const ModifyProfile({Key? key}) : super(key: key);

  @override
  State<ModifyProfile> createState() => _ModifyProfileState();
}

class _ModifyProfileState extends State<ModifyProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  ModifyController modifyController = Get.put(ModifyController());

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }

  File? image;

  void selectImage() async {
    image = await pickImageFromGallery(context);
    debugPrint("image is this : ${image}");
    modifyController.userDataMap.value['profile_pic'] = image;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserModelCubit()..getUserData(),
      child: BlocConsumer<UserModelCubit, UserModelState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<UserModelCubit>(context);
          emailController.text = cubit.userData?.email ?? '';
          phoneController.text = cubit.userData?.phone ?? 'Empty';
          addressController.text = cubit.userData?.address_line ?? 'Empty';
          usernameController.text = cubit.userData?.name ?? 'Empty';
          modifyController.userDataMap.value['address_line'] =
              cubit.userData?.address_line ?? '';
          modifyController.userDataMap.value['phone'] =
              cubit.userData?.phone ?? '';
          modifyController.userDataMap.value['name'] =
              cubit.userData?.name ?? '';
          modifyController.userDataMap.value['email'] =
              cubit.userData?.email ?? '';
          modifyController.userDataMap.value['name'] =
              cubit.userData?.name ?? '';
          // modifyController.user.value = cubit.userData ?? UserData() ;

          return Scaffold(
            backgroundColor: AppColors.k47574C,
            body: SafeArea(
              child: SingleChildScrollView(
                child: (cubit.userData != null)
                    ? Form(
                        key: _formKey,
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
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "EDIT PROFILE",
                                    style: k32_400_bebas,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Confirmation'),
                                                content: Text(
                                                    'Are you sure you want to proceed?'),
                                                // Your description here
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('No'),
                                                    onPressed: () {
                                                      Navigator.of(context).pop(
                                                          false); // Returning false if "No" is selected
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text('Yes'),
                                                    onPressed: () {
                                                      if (_formKey
                                                              .currentState !=
                                                          null) {
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          // Only update the profile if the form is valid
                                                          debugPrint(
                                                              modifyController
                                                                  .userDataMap
                                                                  .value
                                                                  .toString());
                                                          cubit.updateUserProfile(
                                                              modifyController
                                                                  .userDataMap
                                                                  .value,
                                                              image);
                                                          Navigator.of(context)
                                                              .pop(true);
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                           TabScreen(pageIndex: 3,)));
                                                        }
                                                      } else {
                                                        showSnackBar(
                                                            context: context,
                                                            content:
                                                                'Fill in the email and name');
                                                        Navigator.of(context)
                                                            .pop(true);
                                                      }

                                                      // Returning true if "Yes" is selected
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.k000000),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0,
                                                  bottom: 2,
                                                  left: 6,
                                                  right: 6),
                                              child: Text(
                                                'SAVE',
                                                style: k10_700_roboto,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 60,
                                  child: (cubit.userData!.profile_pic
                                          .toString()
                                          .isNotEmpty)
                                      ? (image == null)
                                          ? ClipOval(
                                              child: Image.network(
                                                "https://compagno.app${cubit.userData!.profile_pic.toString().replaceFirst("/api/", "")}",
                                                fit: BoxFit.cover,
                                                // This ensures the image fills the circle
                                                width: 120,
                                                // Set the width and height to match the diameter of the CircleAvatar
                                                height: 120,
                                              ),
                                            )
                                          : Image.file(image!)
                                      : Image.asset("assets/images/user.png"),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 4,
                                  child: InkWell(
                                    onTap: selectImage,
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.k000000,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/edit.png"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Add other common UI elements from the Settings screen
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: TextFormField(
                                  textAlign: TextAlign.start,
                                  controller: usernameController,
                                  style: k32_400_bebas,
                                  onChanged: (value) {
                                    modifyController.user.value.name = value;
                                    modifyController.userDataMap.value['name'] =
                                        value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter your name",
                                      hintStyle: k32_400_bebas),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 20),
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: AppColors.k000000,
                            //     ),
                            //     child: Padding(
                            //       padding: const EdgeInsets.only(
                            //           top: 15, left: 18, right: 9),
                            //       child: Column(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Row(
                            //             children: [
                            //               Text(
                            //                 "INTERESTS",
                            //                 style: k20_400_bebas,
                            //               ),
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 10,
                            //           ),
                            //           const Row(
                            //             children: [
                            //               Expanded(
                            //                 flex: 3,
                            //                 child: SingleChildScrollView(
                            //                   scrollDirection: Axis.horizontal,
                            //                   child: Row(
                            //                     children: [
                            //                       RiderChip("Strength Fitness"),
                            //                       RiderChip("Casual Riding"),
                            //                       RiderChip("Racing"),
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ),
                            //             ],
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 18,
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.k000000,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, top: 18, right: 18, bottom: 18),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Personal Info",
                                            style: k20_400_bebas,
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                      const SizedBox(height: 22),
                                      Row(
                                        children: [
                                          Text(
                                            "Email",
                                            style: k13_400_roboto,
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          // Use a TextFormField for editable text
                                          Expanded(
                                            child: TextFormField(
                                              controller: emailController,
                                              style: k13_400_roboto,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'This field is required';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                modifyController
                                                    .user.value.email = value;

                                                modifyController.userDataMap
                                                    .value['email'] = value;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Enter your email",
                                                  hintStyle: k13_400_roboto),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Text(
                                            "Phone",
                                            style: k13_400_roboto,
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          // Use a TextFormField for editable text
                                          Expanded(
                                            child: TextFormField(
                                              controller: phoneController,
                                              style: k13_400_roboto,
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (value) {
                                                modifyController
                                                    .user.value.phone = value;
                                                modifyController.userDataMap
                                                    .value['phone'] = value;
                                              },
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Enter your phone number",
                                                  hintStyle: k13_400_roboto),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Address",
                                              style: k13_400_roboto,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: TextFormField(
                                              controller: addressController,
                                              style: k13_400_roboto,
                                              onChanged: (value) {
                                                modifyController.userDataMap
                                                        .value['address_line'] =
                                                    value;
                                                modifyController.user.value
                                                    .address_line = value;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Enter your address",
                                                  hintStyle: k13_400_roboto),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Add other UI elements specific to the ModifyProfile screen
                          ],
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: Get.height / 2),
                        child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
// Future<void> showConfirmationDialog(BuildContext context) async {
//   return ,
//   );
}

// RiderChip widget to represent the rider level selection
class RiderChip extends StatelessWidget {
  final String level;

  const RiderChip(this.level);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text(
          level,
          style: k13_400_roboto,
        ),
        backgroundColor: AppColors
            .k69806F, // Use the same background color as the Settings screen
      ),
    );
  }
}
