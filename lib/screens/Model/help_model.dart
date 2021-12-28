import 'dart:convert';

List<HelpModel> postFromJson(String str) =>
    List<HelpModel>.from(json.decode(str).map((x) => HelpModel.fromMap(x)));

class HelpModel {
  HelpModel({
    required this.question,
    required this.answer,
  });

  String question;
  String answer;

  factory HelpModel.fromMap(Map<String, dynamic> json) => HelpModel(
    question: json["question"],
    answer: json["answer"],
  );
}
