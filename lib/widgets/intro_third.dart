import 'package:flutter/material.dart';
import 'package:focus/screens/home_screen.dart';
import 'package:focus/widgets/button.dart';

class IntroThird extends StatelessWidget {
  const IntroThird({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              '3 Steps is all\nyou need',
              style: TextStyle(fontSize: 32, fontFamily: 'lilita'),
            ),
          ),
          const SizedBox(height: 60),
          const Row(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'tap',
                      style: TextStyle(fontSize: 35, fontFamily: 'lilita'),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                        'study',
                        style: TextStyle(fontSize: 35, fontFamily: 'lilita'),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'relax',
                      style: TextStyle(fontSize: 35, fontFamily: 'lilita'),
                    ),
                  ],
                ),
              )),
              Expanded(
                child: Image(
                  image: AssetImage('assets/images/intro_instruction.png'),
                  fit: BoxFit.contain,
                  height: 350,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: CustomButton(
                      text: 'Finish',
                      callback: () {
                        Navigator.pushReplacementNamed(
                            context, HomeScreen.routeName);
                      })),
            ],
          ),
        ],
      ),
    );
  }
}
