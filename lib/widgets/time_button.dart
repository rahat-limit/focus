import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/constants/colors.dart';
import 'package:focus/provider/count_provider.dart';

class TimePickerButton extends ConsumerStatefulWidget {
  const TimePickerButton({super.key});

  @override
  ConsumerState<TimePickerButton> createState() => _TimePickerButtonState();
}

class _TimePickerButtonState extends ConsumerState<TimePickerButton> {
  bool onTapped = false;

  @override
  Widget build(BuildContext context) {
    final isActive = ref.watch(countProvider).isTimerActive;
    final time = ref.read(countProvider.notifier);
    if (isActive == 1) {
      setState(() {
        onTapped = true;
      });
    }
    if (onTapped) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              backgroundColor: Colors.redAccent[100]),
          onPressed: () {
            time.stopCountDown();
            setState(() {
              onTapped = false;
            });
          },
          child: const Text(
            'Stop',
            style: TextStyle(fontSize: 21, fontFamily: 'ledger'),
          ));
    } else {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              backgroundColor: buttonColor),
          onPressed: () {
            final remainingTime = ref.watch(countProvider);
            if (remainingTime.time != 0) {
              time.countDown();
              setState(() {
                onTapped = true;
              });
            }
          },
          child: const Text(
            'Start',
            style: TextStyle(fontSize: 21, fontFamily: 'ledger'),
          ));
    }
  }
}
