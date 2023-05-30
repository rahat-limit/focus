import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/constants/colors.dart';
import 'package:focus/provider/count_provider.dart';
import 'package:focus/widgets/time_picker.dart';

class TimeTextPicker extends ConsumerStatefulWidget {
  const TimeTextPicker({super.key});

  @override
  ConsumerState<TimeTextPicker> createState() => _TimeTextPickerState();
}

final timerProvider =
    StateProvider((ref) => const Duration(minutes: 0, seconds: 0));

class _TimeTextPickerState extends ConsumerState<TimeTextPicker> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(countProvider).remainingTime;
    String minutes = (count ~/ 60).toString().padLeft(2, "0");
    String seconds = (count % 60).toString().padLeft(2, "0");
    return TextButton(
      onPressed: () {
        selectTime(
          context,
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.ms,
            initialTimerDuration:
                Duration(minutes: count ~/ 60, seconds: count % 60),
            minuteInterval: 5,
            secondInterval: 5,
            onTimerDurationChanged: (Duration newDuration) {
              ref.read(countProvider.notifier).setTime(newDuration.inSeconds);
            },
          ),
        );
      },
      child: Text(
        '$minutes:$seconds',
        style: const TextStyle(
            fontFamily: 'lilita', fontSize: 32, color: primeColor),
      ),
    );
  }
}
