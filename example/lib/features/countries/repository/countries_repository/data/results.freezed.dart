// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountriesResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CountryEntity> countries) success,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CountryEntity> countries)? success,
    TResult? Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CountryEntity> countries)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountriesSuccess value) success,
    required TResult Function(_CountriesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CountriesSuccess value)? success,
    TResult? Function(_CountriesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountriesSuccess value)? success,
    TResult Function(_CountriesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountriesResultCopyWith<$Res> {
  factory $CountriesResultCopyWith(
          CountriesResult value, $Res Function(CountriesResult) then) =
      _$CountriesResultCopyWithImpl<$Res, CountriesResult>;
}

/// @nodoc
class _$CountriesResultCopyWithImpl<$Res, $Val extends CountriesResult>
    implements $CountriesResultCopyWith<$Res> {
  _$CountriesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CountriesSuccessCopyWith<$Res> {
  factory _$$_CountriesSuccessCopyWith(
          _$_CountriesSuccess value, $Res Function(_$_CountriesSuccess) then) =
      __$$_CountriesSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CountryEntity> countries});
}

/// @nodoc
class __$$_CountriesSuccessCopyWithImpl<$Res>
    extends _$CountriesResultCopyWithImpl<$Res, _$_CountriesSuccess>
    implements _$$_CountriesSuccessCopyWith<$Res> {
  __$$_CountriesSuccessCopyWithImpl(
      _$_CountriesSuccess _value, $Res Function(_$_CountriesSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countries = null,
  }) {
    return _then(_$_CountriesSuccess(
      null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryEntity>,
    ));
  }
}

/// @nodoc

class _$_CountriesSuccess implements _CountriesSuccess {
  const _$_CountriesSuccess(final List<CountryEntity> countries)
      : _countries = countries;

  final List<CountryEntity> _countries;
  @override
  List<CountryEntity> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  String toString() {
    return 'CountriesResult.success(countries: $countries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountriesSuccess &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_countries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountriesSuccessCopyWith<_$_CountriesSuccess> get copyWith =>
      __$$_CountriesSuccessCopyWithImpl<_$_CountriesSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CountryEntity> countries) success,
    required TResult Function(Failure failure) failure,
  }) {
    return success(countries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CountryEntity> countries)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return success?.call(countries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CountryEntity> countries)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(countries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountriesSuccess value) success,
    required TResult Function(_CountriesFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CountriesSuccess value)? success,
    TResult? Function(_CountriesFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountriesSuccess value)? success,
    TResult Function(_CountriesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _CountriesSuccess implements CountriesResult {
  const factory _CountriesSuccess(final List<CountryEntity> countries) =
      _$_CountriesSuccess;

  List<CountryEntity> get countries;
  @JsonKey(ignore: true)
  _$$_CountriesSuccessCopyWith<_$_CountriesSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CountriesFailureCopyWith<$Res> {
  factory _$$_CountriesFailureCopyWith(
          _$_CountriesFailure value, $Res Function(_$_CountriesFailure) then) =
      __$$_CountriesFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$_CountriesFailureCopyWithImpl<$Res>
    extends _$CountriesResultCopyWithImpl<$Res, _$_CountriesFailure>
    implements _$$_CountriesFailureCopyWith<$Res> {
  __$$_CountriesFailureCopyWithImpl(
      _$_CountriesFailure _value, $Res Function(_$_CountriesFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_CountriesFailure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_CountriesFailure implements _CountriesFailure {
  const _$_CountriesFailure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'CountriesResult.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountriesFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountriesFailureCopyWith<_$_CountriesFailure> get copyWith =>
      __$$_CountriesFailureCopyWithImpl<_$_CountriesFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CountryEntity> countries) success,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CountryEntity> countries)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CountryEntity> countries)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountriesSuccess value) success,
    required TResult Function(_CountriesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CountriesSuccess value)? success,
    TResult? Function(_CountriesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountriesSuccess value)? success,
    TResult Function(_CountriesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _CountriesFailure implements CountriesResult {
  const factory _CountriesFailure(final Failure failure) = _$_CountriesFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_CountriesFailureCopyWith<_$_CountriesFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
