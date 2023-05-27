import 'package:flutter/material.dart';
import 'package:focus/widgets/button.dart';

class IntroSecond extends StatelessWidget {
  final PageController controller;
  const IntroSecond({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Image(
            image: AssetImage('assets/images/second-2.png'),
            width: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    'Introducing the best\nproductivity app that will\nchange the way you work.',
                    style: TextStyle(fontSize: 26, fontFamily: 'lilita'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: CustomButton(callback: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  })),
            ],
          ),
        ],
      ),
    );
  }
}
