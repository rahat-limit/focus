import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/constants/colors.dart';
import 'package:focus/widgets/intro_first.dart';
import 'package:focus/widgets/intro_second.dart';
import 'package:focus/widgets/intro_third.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabBarContentPages = [
      IntroFirst(
        controller: controller,
      ),
      IntroSecond(
        controller: controller,
      ),
      const IntroThird()
    ];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(children: [
          SmoothPageIndicator(
            controller: controller,
            count: tabBarContentPages.length,
            effect: const ExpandingDotsEffect(
                dotWidth: 21,
                dotHeight: 21,
                // ignore: use_full_hex_values_for_flutter_colors
                activeDotColor: buttonColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: tabBarContentPages.length,
              itemBuilder: (context, index) {
                return tabBarContentPages[index % tabBarContentPages.length];
              },
            ),
          ),
        ]),
      )),
    );
  }
}
