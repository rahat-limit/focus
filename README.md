<h1 align="center"> FOCUS App </h1> <br>
<p align="center">
    <img src="https://github.com/rahat-limit/focus/blob/master/git-assets/FOCUS-512x512.png" width="450">
</p>

<p align="center">
  Productive day with FOCUS.
</p>

<p align="center">
<!--  Link to AppStore  -->
<!--   <a href="/">
    <img alt="Download on the App Store" title="App Store" src="http://i.imgur.com/0n2zqHD.png" width="140">
  </a> -->

<!--   <a href="/"> <---- link to play market
    <img alt="Get it on Google Play" title="Google Play" src="http://i.imgur.com/mtGRPuM.png" width="140">
  </a> -->
</p>

## Introduction
Welcome to my respository, which I created due to practice of learning flutter. Here you can easily take a look at some images of app itself and read more info about it. Hope you like it🤙

<!-- **Available for iOS.** -->

<p align="center">
  <img src = "https://github.com/rahat-limit/focus/blob/master/git-assets/focus_desc_1024_500.png" width=600>
</p>

## ✖️ Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.3.6
  freezed_annotation: ^2.2.0
  shared_preferences: ^2.1.1
  smooth_page_indicator: ^1.1.0
  sqflite: ^2.2.8+4
  uuid: ^3.0.7
  fl_chart: ^0.62.0

  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  freezed: ^2.3.4
  build_runner: ^2.4.4
  flutter_lints: ^2.0.0
```

## ✖️ Features

A few of the things you can do with KAWAI:

* [Local Storage SQflite](https://pub.dev/packages/sqflite)
* [State-management RiverPod](https://pub.dev/packages/riverpod)
* [Freezed package](https://pub.dev/packages/freezed)
* [FL Chart - Diagram](https://github.com/imaNNeo/fl_chart/blob/master/example/lib/presentation/samples/pie/pie_chart_sample1.dart)

<p align="center">
    <img src="https://www.postgresql.org//media/img/about/press/elephant.png" width=200>
    <img src="https://github.com/rrousselGit/riverpod/blob/master/resources/icon/Facebook%20Cover%20A.png?raw=true" width=200>
</p>

## ✖️ Splash Screens
<p align='center'>
    <image src='https://github.com/rahat-limit/focus/blob/master/git-assets/int-1.png' width='200'/>
    <image src='https://github.com/rahat-limit/focus/blob/master/git-assets/int-2.png' width='200'/>
    <image src='https://github.com/rahat-limit/focus/blob/master/git-assets/int-3.png' width='200'/>
</p>

## ✖️ Home Screen and Progress Indicator
<p align="center">
  <img src ="https://github.com/rahat-limit/focus/blob/master/git-assets/home.png" width=200>
  <img src ="https://github.com/rahat-limit/focus/blob/master/git-assets/progress.png" width=200>
</p>

## ✖️ Freezed State Model
```dart

part 'count_provider.freezed.dart';

@freezed
class Count with _$Count {
  const factory Count({
    @Default(0) int time,
    @Default(0) int remainingTime,
    @Default([]) List<String> categories,
    @Default(0) int isTimerActive,
    @Default([]) List<Session> sessions,
    // 0 - is not active
  }) = _Count;
  const Count._();
}
```

## ✖️ State Notifier (Riverpod)
```dart

class CountNotifier extends StateNotifier<Count> {
  CountNotifier() : super(const Count()) {
    // load sessions from db
    getSessionFromDb();
  }

  final db = LocalStorage();

  getSessionFromDb() async {
    List<Session> sessions = await db.getSessions();
    state = state.copyWith(sessions: sessions);
    // print(sessions);
  }

  toggleToCategory(String title) async {
    List<String> categories = state.categories.toList();
    if (categories.contains(title)) {
      categories.remove(title);
      state = state.copyWith(categories: categories);
    } else {
      state = state.copyWith(categories: [...categories, title]);
    }
  }

  setTime(int seconds) {
    state =
        state.copyWith(time: seconds, remainingTime: seconds, isTimerActive: 0);
  }

  Future addSessionToDb(Session session) async {
    await db.newSession(session: session);
  }

  void stopCountDown() async {
    state = state.copyWith(time: 0, remainingTime: 0, isTimerActive: 0);
  }

  countDown() {
    const duration = Duration(seconds: 1);
    Timer.periodic(duration, (timer) async {
      int remainingTime = state.remainingTime;
      final DateTime date = DateTime.now();

      Session newSession =
          Session(time: state.time, category: state.categories, date: date);
      if (remainingTime == 0) {
        timer.cancel();
      } else {
        if (state.remainingTime <= state.time / 2 &&
            !state.sessions.contains(newSession)) {
          state = state.copyWith(
              time: 0,
              remainingTime: 0,
              sessions: [...state.sessions, newSession]);
          await addSessionToDb(newSession);
        }
        state =
            state.copyWith(remainingTime: --remainingTime, isTimerActive: 1);
      }
    });
  }
}
```

<h3>Thank you to all! Hire me... 🙏</h3>

