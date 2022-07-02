import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
abstract class CalculatorModel with _$CalculatorModel {
  factory CalculatorModel(
    String id, {
    @Default(0.0) double result,
    @Default("") String inputNumber,
    @Default("") String operator,
    @Default("0123456789") String invalidNumbers,
    @Default("+-*/=") String invalidOperators,
    required String name,
  }) = _CalculatorModel;

  factory CalculatorModel.fromJson(Map<String, dynamic> json) =>
      _$CalculatorModelFromJson(json);
}
