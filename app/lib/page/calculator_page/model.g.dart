// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalculatorModel _$$_CalculatorModelFromJson(Map<String, dynamic> json) =>
    _$_CalculatorModel(
      json['id'] as String,
      number: json['number'] as String? ?? "",
      operator: json['operator'] as String? ?? "",
      pushedButtonHist: (json['pushedButtonHist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      calcHist: (json['calcHist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["0"],
      buffer: json['buffer'] as String? ?? "",
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_CalculatorModelToJson(_$_CalculatorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'operator': instance.operator,
      'pushedButtonHist': instance.pushedButtonHist,
      'calcHist': instance.calcHist,
      'buffer': instance.buffer,
      'name': instance.name,
    };
