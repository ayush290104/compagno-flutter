import 'package:compagno4/constant/color.dart';
import 'package:compagno4/constant/fonts.dart';
import 'package:compagno4/screens/register/viewmodel/register_vm.dart';
import 'package:compagno4/utils/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterVM(),
      builder: (context, state) {
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
                    height: 100,
                    child: Text(
                      "COMPAGNO",
                      style: k36_400_noize,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _textFieldItem(
                      onChange: (p0) {
                        context.read<RegisterVM>().name = p0;
                      },
                      hintText: 'User Name'),
                  _textFieldItem(
                      onChange: (p0) {
                        context.read<RegisterVM>().email = p0;
                      },
                      hintText: 'Email'),
                  _textFieldItem(
                      isSecure: true,
                      onChange: (p0) {
                        context.read<RegisterVM>().password = p0;
                      },
                      hintText: 'Password'),
                  const SizedBox(
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
                          //  register
                          context.read<RegisterVM>().register(onError: (msg) {
                            FlutterToastr.show(msg, context);
                          }, onSuccess: (_) {
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
                      child: Selector<RegisterVM, bool>(
                        selector: (p0, p1) => p1.isLoading,
                        builder: (context, isLoading, child) => Text(
                          isLoading ? "Loading..." : "Register",
                          style: k32_400_bebas,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "You already have an account  ?",
                        style: TextStyle(color: Colors.orange)),
                    const WidgetSpan(
                        child: SizedBox(
                      width: 5,
                    )),
                    TextSpan(
                        text: "please Sign in",
                        style: k18_400_bebas,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, login, (_) => true);
                          }),
                  ])),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _textFieldItem(
    {bool? isSecure,
    required Function(String) onChange,
    required String hintText}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (input) {
        if (input?.isEmpty ?? true) {
          return '$hintText must not be empty';
        } else {
          if (isSecure ?? false) {
            if ((input?.length ?? 0) < 6) {
              return '$hintText must be atleast 6 character long';
            }
          }
          return null;
        }
      },
      onChanged: onChange,
      obscureText: isSecure ?? false,
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
