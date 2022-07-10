// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalculatorModel _$CalculatorModelFromJson(Map<String, dynamic> json) {
  return _CalculatorModel.fromJson(json);
}

/// @nodoc
mixin _$CalculatorModel {
  String get id => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get operator => throw _privateConstructorUsedError;
  List<String> get pushedButtonHist => throw _privateConstructorUsedError;
  List<String> get calcHist => throw _privateConstructorUsedError;
  String get buffer => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculatorModelCopyWith<CalculatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorModelCopyWith<$Res> {
  factory $CalculatorModelCopyWith(
          CalculatorModel value, $Res Function(CalculatorModel) then) =
      _$CalculatorModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String number,
      String operator,
      List<String> pushedButtonHist,
      List<String> calcHist,
      String buffer,
      String name});
}

/// @nodoc
class _$CalculatorModelCopyWithImpl<$Res>
    implements $CalculatorModelCopyWith<$Res> {
  _$CalculatorModelCopyWithImpl(this._value, this._then);

  final CalculatorModel _value;
  // ignore: unused_field
  final $Res Function(CalculatorModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? operator = freezed,
    Object? pushedButtonHist = freezed,
    Object? calcHist = freezed,
    Object? buffer = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      operator: operator == freezed
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      pushedButtonHist: pushedButtonHist == freezed
          ? _value.pushedButtonHist
          : pushedButtonHist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      calcHist: calcHist == freezed
          ? _value.calcHist
          : calcHist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      buffer: buffer == freezed
          ? _value.buffer
          : buffer // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CalculatorModelCopyWith<$Res>
    implements $CalculatorModelCopyWith<$Res> {
  factory _$$_CalculatorModelCopyWith(
          _$_CalculatorModel value, $Res Function(_$_CalculatorModel) then) =
      __$$_CalculatorModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String number,
      String operator,
      List<String> pushedButtonHist,
      List<String> calcHist,
      String buffer,
      String name});
}

/// @nodoc
class __$$_CalculatorModelCopyWithImpl<$Res>
    extends _$CalculatorModelCopyWithImpl<$Res>
    implements _$$_CalculatorModelCopyWith<$Res> {
  __$$_CalculatorModelCopyWithImpl(
      _$_CalculatorModel _value, $Res Function(_$_CalculatorModel) _then)
      : super(_value, (v) => _then(v as _$_CalculatorModel));

  @override
  _$_CalculatorModel get _value => super._value as _$_CalculatorModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? operator = freezed,
    Object? pushedButtonHist = freezed,
    Object? calcHist = freezed,
    Object? buffer = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_CalculatorModel(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      operator: operator == freezed
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      pushedButtonHist: pushedButtonHist == freezed
          ? _value._pushedButtonHist
          : pushedButtonHist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      calcHist: calcHist == freezed
          ? _value._calcHist
          : calcHist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      buffer: buffer == freezed
          ? _value.buffer
          : buffer // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalculatorModel implements _CalculatorModel {
  _$_CalculatorModel(this.id,
      {this.number = "",
      this.operator = "",
      final List<String> pushedButtonHist = const [],
      final List<String> calcHist = const ["0"],
      this.buffer = "",
      required this.name})
      : _pushedButtonHist = pushedButtonHist,
        _calcHist = calcHist;

  factory _$_CalculatorModel.fromJson(Map<String, dynamic> json) =>
      _$$_CalculatorModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String number;
  @override
  @JsonKey()
  final String operator;
  final List<String> _pushedButtonHist;
  @override
  @JsonKey()
  List<String> get pushedButtonHist {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pushedButtonHist);
  }

  final List<String> _calcHist;
  @override
  @JsonKey()
  List<String> get calcHist {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calcHist);
  }

  @override
  @JsonKey()
  final String buffer;
  @override
  final String name;

  @override
  String toString() {
    return 'CalculatorModel(id: $id, number: $number, operator: $operator, pushedButtonHist: $pushedButtonHist, calcHist: $calcHist, buffer: $buffer, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalculatorModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.operator, operator) &&
            const DeepCollectionEquality()
                .equals(other._pushedButtonHist, _pushedButtonHist) &&
            const DeepCollectionEquality().equals(other._calcHist, _calcHist) &&
            const DeepCollectionEquality().equals(other.buffer, buffer) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(operator),
      const DeepCollectionEquality().hash(_pushedButtonHist),
      const DeepCollectionEquality().hash(_calcHist),
      const DeepCollectionEquality().hash(buffer),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_CalculatorModelCopyWith<_$_CalculatorModel> get copyWith =>
      __$$_CalculatorModelCopyWithImpl<_$_CalculatorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalculatorModelToJson(this);
  }
}

abstract class _CalculatorModel implements CalculatorModel {
  factory _CalculatorModel(final String id,
      {final String number,
      final String operator,
      final List<String> pushedButtonHist,
      final List<String> calcHist,
      final String buffer,
      required final String name}) = _$_CalculatorModel;

  factory _CalculatorModel.fromJson(Map<String, dynamic> json) =
      _$_CalculatorModel.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get number => throw _privateConstructorUsedError;
  @override
  String get operator => throw _privateConstructorUsedError;
  @override
  List<String> get pushedButtonHist => throw _privateConstructorUsedError;
  @override
  List<String> get calcHist => throw _privateConstructorUsedError;
  @override
  String get buffer => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CalculatorModelCopyWith<_$_CalculatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
