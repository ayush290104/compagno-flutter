import 'package:compagno4/core/class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';

class CompletedAward extends StatefulWidget {
  final AwardsProgress awardsProgress;

  CompletedAward({Key? key, required this.awardsProgress}) : super(key: key);

  @override
  State<CompletedAward> createState() => _CompletedAwardState();
}

class _CompletedAwardState extends State<CompletedAward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k47574C,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/back.png")),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "COMPLETED AWARD",
                      style: GoogleFonts.bebasNeue(
                        textStyle:  const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kD9D9D9,
                        ),),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                child: (widget.awardsProgress.icon == "")
                    ? Image.asset(
                  'assets/images/award.png',
                  fit: BoxFit.fill,
                )
                    : Image.network(
                  "https://compagno.app${widget.awardsProgress.icon.replaceFirst("/api/", "")}",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildPropertyRow("Title", widget.awardsProgress.title),
                    // _buildPropertyRow(
                    //     "User ID", widget.awardsProgress.userId.toString()),
                    // _buildPropertyRow("Award ID",
                    //     widget.awardsProgress.awardId?.toString() ?? ""),
                    _buildPropertyRow("Progress Count",
                        widget.awardsProgress.progressCount?.toString() ?? ""),
                    _buildPropertyRow("Complete Count",
                        widget.awardsProgress.completeCount?.toString() ?? ""),
                    _buildPropertyRow("Is Completed",
                        widget.awardsProgress.isCompleted?.toString() ?? ""),
                    _buildPropertyRow("Created At",
                        _formatDateTime(widget.awardsProgress.createdAt)),
                    _buildPropertyRow("Updated At",
                        _formatDateTime(widget.awardsProgress.updatedAt)),
                   
                    _buildPropertyRow(
                        "Completion Type", widget.awardsProgress.completionType),
                    _buildPropertyRow("Session Count",
                        widget.awardsProgress.sessionCount?.toString() ?? ""),
                    _buildPropertyRow("Ride Count",
                        widget.awardsProgress.rideCount?.toString() ?? ""),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyRow(String propertyName, String propertyValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              propertyName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(
              ":",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              propertyValue,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return "${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
  }
}
