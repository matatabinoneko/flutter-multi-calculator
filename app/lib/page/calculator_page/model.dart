import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
abstract class CalculatorModel with _$CalculatorModel {
  factory CalculatorModel(
    String id, {
    @Default("0") String number,
    @Default("") String operator,
    @Default([]) List<String> pushedButtonHist,
    @Default(["0"]) List<String> calcHist,
    @Default("") String buffer,
    required String name,
  }) = _CalculatorModel;

  factory CalculatorModel.fromJson(Map<String, dynamic> json) =>
      _$CalculatorModelFromJson(json);
}
