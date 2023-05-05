import 'dart:convert';

import 'package:compagno4/screens/login/login.dart';
import 'package:compagno4/screens/register/register_bloc/auth_cubit.dart';
import 'package:compagno4/screens/register/register_bloc/auth_state.dart';
import 'package:compagno4/constant/color.dart';
import 'package:compagno4/constant/fonts.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class RegisterScreen extends StatefulWidget {

   RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController  = TextEditingController();

  final emailController  = TextEditingController();

  final passwordController  = TextEditingController();

  final confirmPasswordController  = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state){
          if(state is RegisterSuccessState){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
          } else if (
            state is FailedRegisterState
          ){
            showDialog(context: context, builder: (context)=>AlertDialog(
              content: Text(state.message, style: const TextStyle(color: Colors.white),),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state){
          return Scaffold(
            backgroundColor: AppColors.k69806F,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    SizedBox(height: 100,child: Text("COMPAGNO",style: k36_400_noize,),),

                    SizedBox(height: 30,),
                    _textFieldItem(controller: nameController, hintText: 'User Name'),
                    _textFieldItem(controller: emailController, hintText: 'Email'),
                    _textFieldItem(isSecure: true, controller: passwordController, hintText: 'Password'),

                    SizedBox(height: 20,),
                    Container(
                      height: 60,width: 190,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(130.0)),),
                      child: MaterialButton(onPressed: (){if(formKey.currentState!.validate()){
                        //  register
                        BlocProvider.of<RegisterCubit>(context).register(
                            name: nameController.text, email: emailController.text, password: passwordController.text);

                      }},
                        padding: EdgeInsets.symmetric(vertical: 8.5),
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        textColor: Colors.white,
                      minWidth: double.infinity,
                      child: Text(state is RegisterLoadingState? "Loading..." : "Register", style: k32_400_bebas,),),
                    ),
                    SizedBox(height: 20,),
                    RichText(
                        text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: "You already have an account  ?",
                                  style: TextStyle(color:  Colors.orange)
                              ),
                              const WidgetSpan(child: SizedBox(width: 5,)),
                              TextSpan(
                                  text: "please Sign in",
                                  style: k18_400_bebas,
                                  recognizer: TapGestureRecognizer() ..onTap = (){
                                    Navigator.pushReplacementNamed(context, "/login");
                                  }),
                            ]
                        )),
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

Widget _textFieldItem({
  bool? isSecure,
  required TextEditingController controller,
  required String hintText}){
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (input){
        if(controller.text.isEmpty){
          return '$hintText must not be empty';
        }else{
          return null;
        }
      },
      obscureText: isSecure?? false,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,

          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white))),



      // onChanged: (value){
      //   name = value;
      //   setState(() {
      //
      //   });
      // },
    ),
  );
}
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController userEmail =TextEditingController();
//   TextEditingController userName =TextEditingController();
//   TextEditingController password =TextEditingController();
//   TextEditingController confirmPassword =TextEditingController();
//   bool _passwordVisible = false;
//
//   void _register(String name, email, password)async{
//     try{
//       Response response = await post(
//         Uri.parse("https://compagno.app/api/login"),
//         body: {
//           'name': name,
//           'email': email,
//           'password': password,
//         },
//
//
//       );
//       if(response.statusCode == 200)
//       {
//         var data = jsonDecode(response.body.toString());
//         print(data['token']);
//         print('account successful login');
//       } else{
//         print("register failed");
//
//       }
//     }catch(e){
//       print(e.toString());
//     }
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.k69806F,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 100,),
//             SizedBox(height: 100,child: Text("COMPAGNO",style: k36_400_noize,),),
//
//             SizedBox(height: 30,),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextFormField(
//                 controller: userName,
//
//                 keyboardType: TextInputType.emailAddress,
//
//                 decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey,
//                     labelText: "Name", labelStyle: k20_400_bebas,
//                     hintText: "Name", hintStyle: k20_400_bebas,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.white))),
//
//                 validator: (String? value){
//                   if(value!.isEmpty) {
//                     return "User Name Cannot be  Empty";
//                   }
//                   if(value.length<3){
//                     return "Please Enter Valid Name";
//                   }
//                   return null;
//
//                 },
//
//                 // onChanged: (value){
//                 //   name = value;
//                 //   setState(() {
//                 //
//                 //   });
//                 // },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextFormField(
//                 controller: userEmail,
//
//                 keyboardType: TextInputType.emailAddress,
//
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.grey,
//                   labelStyle: k20_400_bebas,
//                   hintStyle: k20_400_bebas,
//                   labelText: "Email",
//                   hintText: "Email", focusColor: Colors.white60,
//                   border: OutlineInputBorder(
//
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(color: Colors.white)),
//                 ),
//
//                 validator: (value){
//                   if(value!.isEmpty){
//                     return "Phone Number Cannot be  Empty";
//                   }
//                   if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
//                     return 'Please enter Valid email';
//                   }
//
//                   return null;
//                 },
//               ),
//             ),
//
//
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextFormField(
//                 controller: password,
//
//                 // controller: _passwordTextEditingController,
//                 keyboardType: TextInputType.emailAddress,
//
//                 decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey,
//                     labelStyle: k20_400_bebas,
//                     hintStyle: k20_400_bebas,
//                     labelText: "Password",
//                     hintText: "Password", focusColor: Colors.white60,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.white)),
//                     suffixIcon: IconButton(icon: (Icon(_passwordVisible? Icons.visibility: Icons.visibility_off, color: Colors.grey,)),
//                       onPressed: () { setState(() {
//                         _passwordVisible =!_passwordVisible;
//                       });},)
//                 ),
//                 validator: (value){
//                   if(value!.isEmpty){
//                     return "Password Cannot be  Empty";
//                   }
//                   else if(value.length<6){
//                     return "Password lenth should be at least 6";
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextFormField(
//                 controller: confirmPassword,
//
//                 keyboardType: TextInputType.emailAddress,
//
//                 decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey,
//                     labelStyle: k20_400_bebas,
//                     hintStyle: k20_400_bebas,
//                     labelText: "Confirm Password",
//                     hintText: "Confirm Password",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.white)),
//                     suffixIcon: IconButton(icon: (Icon(_passwordVisible? Icons.visibility: Icons.visibility_off, color: Colors.grey,)),
//                       onPressed: () { setState(() {
//                         _passwordVisible =!_passwordVisible;
//                       });},)
//                 ),
//
//                 validator: (value){
//                   if(value!.isEmpty){
//                     return "Please re-enter password";
//                   }
//                   print(password.text);
//                   print(confirmPassword.text);
//                   if(password.text!= confirmPassword.text){
//                     return "Password does not match";
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             SizedBox(height: 20,),
//             ButtonWidget(text: "register", onTap: (){
//               _register(userName.text.toString(), userEmail.text.toString(), password.text.toString());
//             }),
//             SizedBox(height: 20,),
//             RichText(
//                 text: TextSpan(
//                     children: [
//                       const TextSpan(
//                           text: "You already have an account  ?",
//                           style: TextStyle(color:  Colors.orange)
//                       ),
//                       const WidgetSpan(child: SizedBox(width: 5,)),
//                       TextSpan(
//                           text: "please Sign in",
//                           style: k18_400_bebas,
//                           recognizer: TapGestureRecognizer() ..onTap = (){
//                             Navigator.pushReplacementNamed(context, "/login");
//                           }),
//                     ]
//                 )),
//           ],
//         ),
//
//       ),
//     );
//   }
// }



