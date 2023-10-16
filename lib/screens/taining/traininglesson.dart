import 'package:compagno4/core/class.dart';
import 'package:compagno4/main.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import 'lesson_completed.dart';

class TrainingLesson extends StatefulWidget {
  final Videos video;
  final int particular;
  const TrainingLesson({Key? key, required this.video, required this.particular}) : super(key: key);

  @override
  State<TrainingLesson> createState() => _TrainingLessonState();
}

class _TrainingLessonState extends State<TrainingLesson> {
  late YoutubePlayerController _controller;
  bool isPlayed = false;

  void _videoListener() {
    try{
      if (_controller.value.playerState == PlayerState.ended) {
        // Perform any actions you want after the video has finished playing.
        print('Video has finished playing.');

        trainCubit.submitIfFinish(widget.video.id.toString());

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LessonCompleted(video: widget.video, particular: trainCubit.currentTrains),
          ),
        );
      }
    } catch(e){
      debugPrint("the error is $e");
    }
  }

  void runYoutubePlayer() {
    // Check if the URL is not null before initializing the controller
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.video.url) ?? '',
      flags: YoutubePlayerFlags(
        enableCaption: true,
        isLive: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   try {
  //     _controller = YoutubePlayerController(
  //       // initialVideoId: YoutubePlayer.convertUrlToId(widget.video.url) ?? '',
  //       initialVideoId: 'q6SelIOjCEA',
  //       flags: YoutubePlayerFlags(
  //         autoPlay: true,
  //         mute: false,
  //       ),
  //     )..addListener(_videoListener);
  //     debugPrint('_controller.value.isReady ${_controller.value.playerState}');
  //   } catch (e) {
  //     debugPrint('Error: $e');
  //   }
  // }

  @override
  void dispose() {
    // _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k47574C,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 26),
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
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, top: 6),
              child: Row(
                children: [
                  Text(
                    widget.video.title,
                    style: k26_400_bebas,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 325,
                height: 31,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.k000000),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "+${widget.video.point} Training Point",
                        style: k13_700_roboto,
                      ),
                      Image.asset(
                        "assets/images/award.png",
                        width: 15,
                        height: 17,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 37),
              child: Row(
                children: [
                  Text(
                    "You’ll gain skills on",
                    style: k20_400_bebas,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(

                child: Text(
                  widget.video.trainingSteps,
                  style: k13_400_roboto,

                  softWrap: true,

                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 54,
              width: 325,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.kB69F4C),
              child: Row(
                children: [
                  const SizedBox(
                    width: 17,
                  ),
                  Image.asset('assets/images/light.png'),
                  const SizedBox(
                    width: 17,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "This session supports your latest bike",
                        style: k13_700_roboto,
                      ),
                      Text(
                        "tuning goal of Assist with Chatter.",
                        style: k13_700_roboto,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: YoutubePlayer(
                controller: _controller,

                onReady: () {
                  _controller.addListener(
                    () => _videoListener(),
                  );
                  _controller.play();
                },
                onEnded: (data) {
                  // Handle video end event
                  _videoListener();
                },

              ),
            )
            // if (_controller.value.isReady)
            //   // Show video player if initialized
            //   AspectRatio(
            //     aspectRatio: 16 / 9, // Adjust aspect ratio if needed
            //     child: YoutubePlayer(
            //       controller: _controller,
            //       onReady: () {
            //         _controller.addListener(
            //           () => _videoListener(),
            //         );
            //         _controller.play();
            //       },
            //       onEnded: (data) {
            //         // Handle video end event
            //         _videoListener();
            //       },
            //     ),
            //   )
            // else
            //   // Show loading indicator if the video is not initialized
            //   Container(
            //     color: Colors.black,
            //     width: 325,
            //     height: 200, // Adjust the height as needed
            //     child: const Center(
            //       child: CircularProgressIndicator(
            //         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
