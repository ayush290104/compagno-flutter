import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import '../../main.dart';
import '../../save_user/constants/constants.dart';
import '../../save_user/network/local_save.dart';
import 'bloc/dashboard_cubit.dart';
import 'bloc/dashboard_state.dart';
import 'bloc/dashboardprev.dart';

class PreviousRidesScreen extends StatefulWidget {
  const PreviousRidesScreen({Key? key}) : super(key: key);

  @override
  State<PreviousRidesScreen> createState() => _PreviousRidesScreenState();
}

class _PreviousRidesScreenState extends State<PreviousRidesScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider.value(
        value: dashboardCubit..fetch(SaveId.getSaveData(key: token)))
    ],
    child: Scaffold(
      backgroundColor: AppColors.k47574C,

    body: SafeArea(
      child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return  (state is DashboardSuccessState)
                ?
            Column(
              
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
                const SizedBox(
                  height: 35,
                ),
                Text("List of Previous rides",style:  TextStyle(
                  fontSize: 20,
                  fontFamily: "Noize Sport Free Vertion",
                  fontWeight: FontWeight.w400,
                  color: AppColors.kFFFFFF,
                ),),
                const SizedBox(
                  height: 35,
                ),
                Expanded(

                  child: ListView.builder(
                    itemCount: dashboardCubit.dashboardClass!.data!.previousRide!.length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          
                          decoration: BoxDecoration(
                          
                            borderRadius: BorderRadius.circular(20),
                             color: Colors.black
                          ),
                          child: ListTile(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context) =>
                                   Dashboard2(myInteger: index,)) );

                            },
                            title: Text("Name: ${dashboardCubit.dashboardClass!.data!.previousRide![index].name}",style: k16_400_bebas,),
                            subtitle: Text("Total Time ${dashboardCubit.dashboardClass!.data!.previousRide![index].totalTime}",style: k20_400_bebas,),
                            trailing: Text("Id is ${dashboardCubit.dashboardClass!.data!.previousRide![index].id}",style: k20_400_bebas),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ):Align(alignment: Alignment.center,child: const CircularProgressIndicator());
          }
                  ),
    ),

            ),
          );











  }
}
