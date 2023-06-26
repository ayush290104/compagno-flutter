import 'package:compagno4/core/class.dart';
import 'package:compagno4/main.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/fonts.dart';
import 'lesson_completed.dart';
import 'package:video_player/video_player.dart';

class TrainingLesson extends StatefulWidget {
  final Videos video;
  const TrainingLesson({Key? key, required this.video}) : super(key: key);

  @override
  State<TrainingLesson> createState() => _TrainingLessonState();
}

class _TrainingLessonState extends State<TrainingLesson> {
  late VideoPlayerController _controller;
  bool isPlayed = false;

  void _videoListener() {
    final bool isVideoFinished =
        _controller.value.position >= _controller.value.duration;

    if (isVideoFinished) {
      // Perform any actions you want after the video has finished playing.
      print('Video has finished playing.');

      trainCubit.submitIfFinish(widget.video.id.toString());

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LessonCompleted(video: widget.video)));
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
        isPlayed = true;
        _controller.addListener(_videoListener);
      });
  }

  @override
  void dispose() {
    _controller
        .removeListener(_videoListener); // Remove listener before disposing.
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
                  Spacer(),
                  Text(
                    "POWERED BY",
                    style: k10_400_bebas,
                  ),
                  Image.asset('assets/images/METALLO.png'),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(
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
            SizedBox(
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
            SizedBox(
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
            SizedBox(
              height: 21,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 51, bottom: 21),
              child: Row(
                children: [
                  Text(
                    widget.video.trainingSteps,
                    style: k13_400_roboto,
                  ),
                ],
              ),
            ),
            SizedBox(
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
                  SizedBox(
                    width: 17,
                  ),
                  Image.asset('assets/images/light.png'),
                  SizedBox(
                    width: 17,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
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
            SizedBox(
              height: 40,
            ),
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: GestureDetector(
                        onTap: () {
                          if (isPlayed) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                          isPlayed = !isPlayed;
                          setState(() {});
                        },
                        child: VideoPlayer(_controller)),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
