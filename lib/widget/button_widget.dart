
import 'package:compagno4/constant/color.dart';
import 'package:compagno4/constant/fonts.dart';
import 'package:compagno4/core/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/register/register_bloc/register_bloc.dart';

class ButtonWidget extends StatelessWidget {
  final String text;

  final VoidCallback onTap;
  const ButtonWidget({Key? key,
    required this.text,
    required this.onTap, }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(

    height: 50,width: 170,
    decoration: const BoxDecoration(
     color: Colors.white,
       borderRadius: BorderRadius.all(Radius.circular(120.0)),),
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        backgroundColor: MaterialStateProperty.all(Colors.grey),
      ),
        onPressed: onTap, child: Text(text, style: k32_400_bebas,)),
  );
}


// class LoginButtonWidget extends StatelessWidget {
//   const LoginButtonWidget(
//       {Key? key,
//         required this.focusNode,
//         required this.userEmail,
//         required this.password})
//       : super(key: key);
//
//   final FocusNode focusNode;
//   final TextEditingController userEmail;
//   final TextEditingController password;
//
//   @override
//   Widget build(BuildContext context) => Container(
//
//     height: 50,width: 170,
//     decoration: const BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.all(Radius.circular(120.0)),),
//     child: ElevatedButton(
//       focusNode: focusNode,
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
//           backgroundColor: MaterialStateProperty.all(Colors.grey),
//         ),
//         onPressed: (){ BlocProvider.of<LoginBloc>(context)
//             .add(Login(userEmail.text, password.text,));
//
//
//             },
//         child: Text("LOGIN", style: k32_400_bebas,)),
//   );
//
//
// }
//
//
//
//
// class RegiButtonWidget extends StatelessWidget {
//   const RegiButtonWidget(
//       {Key? key,
//
//         required this.userName,
//         required this.userEmail,
//         required this.password,
//         required this.confirmPassword,
//       })
//       : super(key: key);
//
//
//   final TextEditingController userName;
//   final TextEditingController password;
//   final TextEditingController userEmail;
//   final TextEditingController confirmPassword;
//
//   @override
//   Widget build(BuildContext context) => Container(
//
//     height: 50,width: 170,
//     decoration: const BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.all(Radius.circular(120.0)),),
//     child: ElevatedButton(
//
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
//           backgroundColor: MaterialStateProperty.all(Colors.grey),
//         ),
//         onPressed: (){
//           BlocProvider.of<RegisterBloc>(context)
//             .add(Register(userEmail.text,userName.text, password.text, confirmPassword.text));
//           },
//         child: Text("REGISTER", style: k32_400_bebas,)),
//   );
// }