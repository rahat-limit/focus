import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/constants/colors.dart';
import 'package:focus/screens/error_screen.dart';
import 'package:focus/screens/home_screen.dart';
import 'package:focus/screens/intro_screen.dart';
import 'package:focus/screens/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenDivider extends ConsumerStatefulWidget {
  const ScreenDivider({super.key});

  @override
  ConsumerState<ScreenDivider> createState() => _ScreenDividerState();
}

final screenProvider = FutureProvider<int>((ref) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
  // - to see intro screen
  bool check = pref.getBool('seen') ?? false;
  if (!check) {
    await pref.setBool('seen', true);
    return 1;
  }
  return 0;
});

class _ScreenDividerState extends ConsumerState<ScreenDivider> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [const HomeScreen(), const IntroScreen()];
    final config = ref.watch(screenProvider);
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldColor,
        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          headline1: TextStyle(color: primeColor, fontFamily: 'ledger'),
          // ignore: deprecated_member_use
          headline2: TextStyle(color: primeColor, fontFamily: 'ledger'),
          // ignore: deprecated_member_use
          bodyText2: TextStyle(color: primeColor, fontFamily: 'ledger'),
          // ignore: deprecated_member_use
          subtitle1: TextStyle(color: primeColor, fontFamily: 'ledger'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: config.when(
          data: (index) => screens[index],
          error: (err, stack) => const ErrorScreen(),
          loading: () => const LoadingScreen()),
      routes: {HomeScreen.routeName: (context) => const HomeScreen()},
    );
  }
}
