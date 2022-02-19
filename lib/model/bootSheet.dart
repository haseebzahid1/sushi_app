// To parse this JSON data, do
//
//     final bottomSheet = bottomSheetFromJson(jsonString);

import 'dart:convert';

List<BottomSheet> bottomSheetFromJson(String str) => List<BottomSheet>.from(json.decode(str).map((x) => BottomSheet.fromJson(x)));

String bottomSheetToJson(List<BottomSheet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BottomSheet {
  BottomSheet({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  factory BottomSheet.fromJson(Map<String, dynamic> json) => BottomSheet(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
