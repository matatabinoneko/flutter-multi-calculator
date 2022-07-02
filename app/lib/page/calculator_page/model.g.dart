// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalculatorModel _$$_CalculatorModelFromJson(Map<String, dynamic> json) =>
    _$_CalculatorModel(
      json['id'] as String,
      result: (json['result'] as num?)?.toDouble() ?? 0.0,
      inputNumber: json['inputNumber'] as String? ?? "",
      operator: json['operator'] as String? ?? "",
      invalidNumbers: json['invalidNumbers'] as String? ?? "0123456789",
      invalidOperators: json['invalidOperators'] as String? ?? "+-*/=",
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_CalculatorModelToJson(_$_CalculatorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'result': instance.result,
      'inputNumber': instance.inputNumber,
      'operator': instance.operator,
      'invalidNumbers': instance.invalidNumbers,
      'invalidOperators': instance.invalidOperators,
      'name': instance.name,
    };
