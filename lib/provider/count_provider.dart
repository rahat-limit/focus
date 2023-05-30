import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus/models/session_model.dart';
import 'package:focus/services/local_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

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

final countProvider = StateNotifierProvider<CountNotifier, Count>((ref) {
  return CountNotifier();
});

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
