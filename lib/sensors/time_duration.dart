class TimerHelper {
  DateTime? _startTime;
  DateTime? _stopTime;
  void startTimer() {
    _startTime = DateTime.now();
  }

  void stopTimer() {
    _stopTime = DateTime.now();
  }

  Duration? getTotalTime() {
    if (_startTime != null && _stopTime != null) {
      return _stopTime!.difference(_startTime!);
    }
    return null;
  }
}

TimerHelper timerHelper = TimerHelper();
void startFunction() {
  timerHelper.startTimer();
}

int stopFunction() {
  Duration? totalTime = timerHelper.getTotalTime();
  return totalTime?.inSeconds ?? 0;
}

int disposeTimer() {
  timerHelper.stopTimer();
  Duration? totalTime = timerHelper.getTotalTime();
  return totalTime?.inSeconds ?? 0;
}
