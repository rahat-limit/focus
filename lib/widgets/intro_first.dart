import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/widgets/button.dart';

class IntroFirst extends ConsumerWidget {
  final PageController controller;
  const IntroFirst({super.key, required this.controller});

  @override
  Widget build(BuildContext context, ref) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      'Are you tired of feeling\noverwhelmed and\nunproductive?',
                      style: TextStyle(fontSize: 30, fontFamily: 'lilita'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Image(
              image: AssetImage('assets/images/first.png'),
              width: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: CustomButton(callback: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                })),
          ]),
    );
  }
}
