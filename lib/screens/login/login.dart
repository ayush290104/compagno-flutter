import 'dart:convert';

import 'package:compagno4/constant/fonts.dart';
import 'package:compagno4/main.dart';
import 'package:compagno4/utils/route.dart';
import 'package:compagno4/widget/button_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../constant/color.dart';
import '../tabsrceen/tabscreen.dart';
import 'loginBloc/login_cubit.dart';
import 'loginBloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: loginCubit)],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TabScreen()));
          }
          if (state is FailedToLoginState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
              alignment: Alignment.center,
              height: 50,
              child: Text(state.massage),
            )));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.k69806F,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 150,
                      child: Text(
                        "COMPAGNO",
                        style: k36_400_noize,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
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
                                  BorderSide(color: Colors.transparent)),
                        ),

                        // validator: (value) {
                        //   if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                        //     return 'Email is no valid';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        obscureText: true,
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
                              borderSide: BorderSide(color: Colors.white)),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: 190,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(130.0)),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //  Login

                            loginCubit.login(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        padding: EdgeInsets.symmetric(vertical: 8.5),
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        child: Text(
                          (state is LoginLoadingState) ? "Loading..." : "Login",
                          style: k32_400_bebas,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "don't have an account ?",
                          style: TextStyle(color: Colors.green)),
                      WidgetSpan(
                          child: SizedBox(
                        width: 5,
                      )),
                      TextSpan(
                          text: "Register hear",
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

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
// TextEditingController userEmail =TextEditingController();
// TextEditingController password =TextEditingController();
// bool _passwordVisible = false;
//
// void login(String email, password)async{
//   try{
// Response response = await post(
//   Uri.parse("https://compagno.app/api/login"),
//   body: {
//     'email': email,
//     'password': password,
//   },
//
//
// );
// if(response.statusCode == 200)
// {
//   var data = jsonDecode(response.body.toString());
//   print(data['token']);
//   print('account successful login');
//   Navigator.pushNamed(context, tapScreen);
// } else{
//   print("filed");
//
// }
//   }catch(e){
//     print(e.toString());
//
//   }
//
//
// }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 100,),
//             SizedBox(height: 150,child: Text("COMPAGNO",style: k36_400_noize,),),
//
//             SizedBox(height: 30,),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextFormField(
//
//                 autofocus: false,
//
//                 controller: userEmail,
//
//                 keyboardType: TextInputType.emailAddress,
//
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.grey,
//                   labelText: "Email", labelStyle: k20_400_bebas,
//                   hintText: "Email", hintStyle: k20_400_bebas,
//                   focusColor: Colors.white60,
//                   border: OutlineInputBorder(
//
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(color: Colors.transparent)),
//                 ),
//
//                 // validator: (value) {
//                 //   if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
//                 //     return 'Email is no valid';
//                 //   }
//                 //   return null;
//                 // },
//               ),
//             ),
//             SizedBox(height: 20,),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextFormField(
//                 validator: (value) => value!.isEmpty? 'please enter password':null,
//                 controller: password,
//
//                 // onSaved: (input) => requestModel.password =input,
//
//                 // controller: _passwordTextEditingController,
//                 keyboardType: TextInputType.emailAddress,
//
//                 decoration: InputDecoration(
//                     filled: true,
//
//                     fillColor: Colors.grey,
//                     labelText: "Password",labelStyle: k20_400_bebas,
//                     hintText: "Password",hintStyle: k20_400_bebas,
//                     focusColor: Colors.white60,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.white)),
//                     suffixIcon: IconButton(icon: (Icon(_passwordVisible? Icons.visibility: Icons.visibility_off, color: Colors.white,)),
//                       onPressed: () { setState(() {
//                         _passwordVisible =!_passwordVisible;
//                       });},)
//                 ),
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 // validator: (value){
//                 //   if(value!.isEmpty){
//                 //     return "Password Cannot be  Empty";
//                 //   }
//                 //   else if(value.length<6){
//                 //     return "Password lenth should be at least 6";
//                 //   }
//                 //   return null;
//                 // },
//               ),
//             ),
//             SizedBox(height: 20,),
//             ButtonWidget(text: "Login", onTap: ()
//             {
//               login(userEmail.text.toString(), password.text.toString());
//               },
//             ),
//             SizedBox(height: 35,),
//             RichText(
//                 text: TextSpan(
//                     children: [
//                       const TextSpan(
//                           text: "don't have an account ?",
//                           style: TextStyle(color:  Colors.green)
//                       ),
//                       WidgetSpan(child: SizedBox(width: 5,)),
//                       TextSpan(
//                           text: "Register hear",
//                           style: k18_400_bebas,
//                           recognizer: TapGestureRecognizer() ..onTap = (){
//                             Navigator.pushReplacementNamed(context, "/register");
//                           }),
//                     ]
//                 )),
//           ],
//         ),
//       ),
//     );
// //   }
// // }
//
//   // @override
//   // Widget buildInitialInput() => SingleChildScrollView(
//   //   child: Form(
//   //     key: globalFormKey,
//   //     child: Column(
//   //             children: [
//   //               SizedBox(height: 100,),
//   //               SizedBox(height: 150,child: Text("COMPAGNO",style: k36_400_noize,),),
//   //
//   //               SizedBox(height: 30,),
//   //               Padding(
//   //                 padding: const EdgeInsets.all(15.0),
//   //                 child: TextFormField(
//   //                   autofocus: false,
//   //
//   //                   controller: userEmail,
//   //                   focusNode: userEmailFocus,
//   //                   keyboardType: TextInputType.emailAddress,
//   //
//   //                   decoration: InputDecoration(
//   //                     filled: true,
//   //                     fillColor: Colors.grey,
//   //                     labelText: "Email", labelStyle: k20_400_bebas,
//   //                     hintText: "Email", hintStyle: k20_400_bebas,
//   //                     focusColor: Colors.white60,
//   //                     border: OutlineInputBorder(
//   //
//   //                         borderRadius: BorderRadius.circular(12),
//   //                         borderSide: BorderSide(color: Colors.transparent)),
//   //                   ),
//   //
//   //                   // validator: (value) {
//   //                   //   if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
//   //                   //     return 'Email is no valid';
//   //                   //   }
//   //                   //   return null;
//   //                   // },
//   //                 ),
//   //               ),
//   //               SizedBox(height: 20,),
//   //               Padding(
//   //                 padding: const EdgeInsets.all(15.0),
//   //                 child: TextFormField(
//   //                   validator: (value) => value!.isEmpty? 'please enter password':null,
//   //                   controller: password,
//   //                   focusNode: passwordFocus,
//   //                   // onSaved: (input) => requestModel.password =input,
//   //
//   //                   // controller: _passwordTextEditingController,
//   //                   keyboardType: TextInputType.emailAddress,
//   //
//   //                   decoration: InputDecoration(
//   //                     filled: true,
//   //                       fillColor: Colors.grey,
//   //                       labelText: "Password",labelStyle: k20_400_bebas,
//   //                       hintText: "Password",hintStyle: k20_400_bebas,
//   //                       focusColor: Colors.white60,
//   //                       border: OutlineInputBorder(
//   //                           borderRadius: BorderRadius.circular(12),
//   //                           borderSide: BorderSide(color: Colors.white)),
//   //                       suffixIcon: IconButton(icon: (Icon(_passwordVisible? Icons.visibility: Icons.visibility_off, color: Colors.white,)),
//   //                         onPressed: () { setState(() {
//   //                           _passwordVisible =!_passwordVisible;
//   //                         });},)
//   //                   ),
//   //                   autovalidateMode: AutovalidateMode.onUserInteraction,
//   //                   // validator: (value){
//   //                   //   if(value!.isEmpty){
//   //                   //     return "Password Cannot be  Empty";
//   //                   //   }
//   //                   //   else if(value.length<6){
//   //                   //     return "Password lenth should be at least 6";
//   //                   //   }
//   //                   //   return null;
//   //                   // },
//   //                 ),
//   //               ),
//   //               SizedBox(height: 20,),
//   //               ButtonWidget(text: "Login", onTap: ()
//   //               {
//   //                 if (validateAndSave()) {
//   //                   print(loginRequestModel.toJson());
//   //
//   //                   setState(() {
//   //                     isApiCallProcess = true;
//   //                   });
//   //
//   //                   ApiService apiService = ApiService();
//   //                   apiService.login(loginRequestModel).then((value) {
//   //                     if (value != null) {
//   //                       setState(() {
//   //                         isApiCallProcess = false;
//   //                       });
//   //
//   //                       if (value.token!.isNotEmpty) {
//   //                         final snackBar = SnackBar(
//   //                             content: Text("Login Successful"));
//   //                         scaffoldKey.currentState;
//   //
//   //                       } else {
//   //                         final snackBar =
//   //                         SnackBar(content: Text('error'));
//   //                         scaffoldKey.currentState;
//   //
//   //                       }
//   //                     }
//   //                   });
//   //                 }
//   //               },
//   //               ),
//   //               SizedBox(height: 35,),
//   //               RichText(
//   //                   text: TextSpan(
//   //                       children: [
//   //                         const TextSpan(
//   //                             text: "don't have an account ?",
//   //                             style: TextStyle(color:  Colors.green)
//   //                         ),
//   //                         WidgetSpan(child: SizedBox(width: 5,)),
//   //                         TextSpan(
//   //                             text: "Register hear",
//   //                             style: k18_400_bebas,
//   //                             recognizer: TapGestureRecognizer() ..onTap = (){
//   //                               Navigator.pushReplacementNamed(context, "/register");
//   //                             }),
//   //                       ]
//   //                   )),
//   //             ],
//   //           ),
//   //   ),
//   //
//   //
//   //   );
