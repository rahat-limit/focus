import 'package:flutter/material.dart';
import 'package:focus/constants/colors.dart';
import 'package:focus/screens/progress_screen.dart';
import 'package:focus/widgets/tag_list.dart';
import 'package:focus/widgets/text_time_picker.dart';
import 'package:focus/widgets/time_button.dart';
import 'package:focus/widgets/timer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 75,
        title: const Text(
          'home',
          style: TextStyle(fontFamily: 'lilita', fontSize: 32),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ProgressScreen.routeName);
                  },
                  child: const Image(
                    image: AssetImage('assets/images/medal.png'),
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  )),
            ],
          ),
          const SizedBox(
            width: 25,
          )
        ],
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 350,
              image: AssetImage(
                'assets/images/home.png',
              ),
            ),
            TimerWidget(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: TagList(),
            ),
            SizedBox(
              height: 5,
            ),
            TimeTextPicker(),
            SizedBox(
              height: 10,
            ),
            TimePickerButton(),
          ],
        ),
      )),
    );
  }
}
