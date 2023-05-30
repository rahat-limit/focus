// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Count {
  int get time => throw _privateConstructorUsedError;
  int get remainingTime => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  int get isTimerActive => throw _privateConstructorUsedError;
  List<Session> get sessions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountCopyWith<Count> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountCopyWith<$Res> {
  factory $CountCopyWith(Count value, $Res Function(Count) then) =
      _$CountCopyWithImpl<$Res, Count>;
  @useResult
  $Res call(
      {int time,
      int remainingTime,
      List<String> categories,
      int isTimerActive,
      List<Session> sessions});
}

/// @nodoc
class _$CountCopyWithImpl<$Res, $Val extends Count>
    implements $CountCopyWith<$Res> {
  _$CountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? remainingTime = null,
    Object? categories = null,
    Object? isTimerActive = null,
    Object? sessions = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isTimerActive: null == isTimerActive
          ? _value.isTimerActive
          : isTimerActive // ignore: cast_nullable_to_non_nullable
              as int,
      sessions: null == sessions
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountCopyWith<$Res> implements $CountCopyWith<$Res> {
  factory _$$_CountCopyWith(_$_Count value, $Res Function(_$_Count) then) =
      __$$_CountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int time,
      int remainingTime,
      List<String> categories,
      int isTimerActive,
      List<Session> sessions});
}

/// @nodoc
class __$$_CountCopyWithImpl<$Res> extends _$CountCopyWithImpl<$Res, _$_Count>
    implements _$$_CountCopyWith<$Res> {
  __$$_CountCopyWithImpl(_$_Count _value, $Res Function(_$_Count) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? remainingTime = null,
    Object? categories = null,
    Object? isTimerActive = null,
    Object? sessions = null,
  }) {
    return _then(_$_Count(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isTimerActive: null == isTimerActive
          ? _value.isTimerActive
          : isTimerActive // ignore: cast_nullable_to_non_nullable
              as int,
      sessions: null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc

class _$_Count extends _Count with DiagnosticableTreeMixin {
  const _$_Count(
      {this.time = 0,
      this.remainingTime = 0,
      final List<String> categories = const [],
      this.isTimerActive = 0,
      final List<Session> sessions = const []})
      : _categories = categories,
        _sessions = sessions,
        super._();

  @override
  @JsonKey()
  final int time;
  @override
  @JsonKey()
  final int remainingTime;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final int isTimerActive;
  final List<Session> _sessions;
  @override
  @JsonKey()
  List<Session> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Count(time: $time, remainingTime: $remainingTime, categories: $categories, isTimerActive: $isTimerActive, sessions: $sessions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Count'))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('remainingTime', remainingTime))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('isTimerActive', isTimerActive))
      ..add(DiagnosticsProperty('sessions', sessions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Count &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.isTimerActive, isTimerActive) ||
                other.isTimerActive == isTimerActive) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      remainingTime,
      const DeepCollectionEquality().hash(_categories),
      isTimerActive,
      const DeepCollectionEquality().hash(_sessions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountCopyWith<_$_Count> get copyWith =>
      __$$_CountCopyWithImpl<_$_Count>(this, _$identity);
}

abstract class _Count extends Count {
  const factory _Count(
      {final int time,
      final int remainingTime,
      final List<String> categories,
      final int isTimerActive,
      final List<Session> sessions}) = _$_Count;
  const _Count._() : super._();

  @override
  int get time;
  @override
  int get remainingTime;
  @override
  List<String> get categories;
  @override
  int get isTimerActive;
  @override
  List<Session> get sessions;
  @override
  @JsonKey(ignore: true)
  _$$_CountCopyWith<_$_Count> get copyWith =>
      throw _privateConstructorUsedError;
}
