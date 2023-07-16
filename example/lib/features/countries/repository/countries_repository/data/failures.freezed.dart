// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountriesFailure {
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String message) dataUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String message)? dataUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String message)? dataUnavailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataUnavailable value) dataUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataUnavailable value)? dataUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataUnavailable value)? dataUnavailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountriesFailureCopyWith<CountriesFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountriesFailureCopyWith<$Res> {
  factory $CountriesFailureCopyWith(
          CountriesFailure value, $Res Function(CountriesFailure) then) =
      _$CountriesFailureCopyWithImpl<$Res, CountriesFailure>;
  @useResult
  $Res call({String title, String message});
}

/// @nodoc
class _$CountriesFailureCopyWithImpl<$Res, $Val extends CountriesFailure>
    implements $CountriesFailureCopyWith<$Res> {
  _$CountriesFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataUnavailableCopyWith<$Res>
    implements $CountriesFailureCopyWith<$Res> {
  factory _$$DataUnavailableCopyWith(
          _$DataUnavailable value, $Res Function(_$DataUnavailable) then) =
      __$$DataUnavailableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message});
}

/// @nodoc
class __$$DataUnavailableCopyWithImpl<$Res>
    extends _$CountriesFailureCopyWithImpl<$Res, _$DataUnavailable>
    implements _$$DataUnavailableCopyWith<$Res> {
  __$$DataUnavailableCopyWithImpl(
      _$DataUnavailable _value, $Res Function(_$DataUnavailable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$DataUnavailable(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataUnavailable implements DataUnavailable {
  const _$DataUnavailable({required this.title, required this.message});

  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'CountriesFailure.dataUnavailable(title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataUnavailable &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataUnavailableCopyWith<_$DataUnavailable> get copyWith =>
      __$$DataUnavailableCopyWithImpl<_$DataUnavailable>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String message) dataUnavailable,
  }) {
    return dataUnavailable(title, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String message)? dataUnavailable,
  }) {
    return dataUnavailable?.call(title, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String message)? dataUnavailable,
    required TResult orElse(),
  }) {
    if (dataUnavailable != null) {
      return dataUnavailable(title, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataUnavailable value) dataUnavailable,
  }) {
    return dataUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataUnavailable value)? dataUnavailable,
  }) {
    return dataUnavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataUnavailable value)? dataUnavailable,
    required TResult orElse(),
  }) {
    if (dataUnavailable != null) {
      return dataUnavailable(this);
    }
    return orElse();
  }
}

abstract class DataUnavailable implements CountriesFailure {
  const factory DataUnavailable(
      {required final String title,
      required final String message}) = _$DataUnavailable;

  @override
  String get title;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$DataUnavailableCopyWith<_$DataUnavailable> get copyWith =>
      throw _privateConstructorUsedError;
}
