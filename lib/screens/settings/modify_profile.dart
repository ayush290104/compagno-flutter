import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../tabsrceen/user_mode_state.datr.dart';
import '../tabsrceen/user_model_cubit.dart';

class ModifyProfile extends StatefulWidget {
  const ModifyProfile({Key? key}) : super(key: key);

  @override
  State<ModifyProfile> createState() => _ModifyProfileState();
}

class _ModifyProfileState extends State<ModifyProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
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
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EDIT PROFILE",
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
                                InkWell(
                                  child: Text(
                                    'SAVE',
                                    style: k10_700_roboto,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // Add other common UI elements from the Settings screen
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.k000000,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 18, right: 9),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Rider Level",
                                    style: k20_400_bebas,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        RiderChip("BEGINNER"),
                                        RiderChip("INTERMEDIATE"),
                                        RiderChip("EXPERT"),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter your phone number",
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
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter your address",
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
              ),
            ),
          );
        },
      ),
    );
  }
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
