import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/constants/colors.dart';
import 'package:focus/provider/count_provider.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final count = ref.watch(countProvider).remainingTime;
      final time = ref.watch(countProvider).time;

      String minutes = (count ~/ 60).toString().padLeft(2, "0");
      String seconds = (count % 60).toString().padLeft(2, "0");
      return Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: timerColor,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation(borderTimerColor),
              strokeWidth: 11,
              value: time == 0 ? count / 0.001 : count / time,
            ),
            Center(
              child: Text(
                '$minutes:$seconds',
                style: const TextStyle(fontSize: 32, fontFamily: 'lilita'),
              ),
            )
          ],
        ),
      );
    });
  }
}
