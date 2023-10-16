import 'package:compagno4/constant/fonts.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/screens/login/viewmodel/login_vm.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../tabsrceen/tabscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginVM(),
      child:
          // BlocConsumer<LoginCubit, LoginState>(
          //   listener: (context, state) {
          //     if (state is LoginSuccessState) {
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //               builder: (BuildContext context) => TabScreen()));
          //     }
          //     if (state is FailedToLoginState) {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //           content: Container(
          //         alignment: Alignment.center,
          //         height: 50,
          //         child: Text(state.massage),
          //       )));
          //     }
          //   },
          Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.k69806F,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 150,
                      child: Text(
                        "COMPAGNO",
                        style: k36_400_noize,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        onChanged: (value) {
                          context.read<LoginVM>().email = value;
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (input) {
                          if (emailController.text.isNotEmpty) {
                            return null;
                          } else {
                            return "Email must ot be empty";
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          labelText: "Email",
                          labelStyle: k20_400_bebas,
                          hintText: "Email",
                          hintStyle: k20_400_bebas,
                          focusColor: Colors.white60,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                        ),

                        // validator: (value) {
                        //   if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                        //     return 'Email is no valid';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        obscureText: true,
                        onChanged: (value) {
                          context.read<LoginVM>().password = value;
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (input) {
                          if (emailController.text.isNotEmpty) {
                            return null;
                          } else {
                            return "Password must ot be empty";
                          }
                        },

                        decoration: InputDecoration(
                          filled: true,

                          fillColor: Colors.grey,
                          labelText: "Password", labelStyle: k20_400_bebas,
                          hintText: "Password", hintStyle: k20_400_bebas,
                          focusColor: Colors.white60,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          // suffixIcon: IconButton(icon: (Icon(_passwordVisible? Icons.visibility: Icons.visibility_off, color: Colors.white,)),
                          //   onPressed: () { setState(() {
                          //     _passwordVisible =!_passwordVisible;
                          //   });},)
                        ),

                        // validator: (value){
                        //   if(value!.isEmpty){
                        //     return "Password Cannot be  Empty";
                        //   }
                        //   else if(value.length<6){
                        //     return "Password lenth should be at least 6";
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Selector<LoginVM, bool>(
                      selector: (p0, p1) => p1.isLoading,
                      builder: (context, value, child) => Container(
                        height: 60,
                        width: 190,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(130.0)),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginVM>().login(onError: (msg) {
                                FlutterToastr.show(msg, context);
                              }, onSuccess: (response) {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, tabScreen);
                              });
                            }
                          },
                          padding: const EdgeInsets.symmetric(vertical: 8.5),
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          textColor: Colors.white,
                          minWidth: double.infinity,
                          child: Text(
                            value ? "Loading..." : "Login",
                            style: k32_400_bebas,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "don't have an account ?",
                          style: TextStyle(color: Colors.green)),
                      const WidgetSpan(
                          child: SizedBox(
                        width: 5,
                      )),
                      TextSpan(
                          text: "Register here",
                          style: k18_400_bebas,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                  context, "/register");
                            }),
                    ])),
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
