// To parse this JSON data, do
//
//     final callModel = callModelFromJson(jsonString);

import 'dart:convert';

CallModel callModelFromJson(String str) => CallModel.fromJson(json.decode(str));

String callModelToJson(CallModel data) => json.encode(data.toJson());

class CallModel {
  CallModel({
    this.time,
    this.name,
  });

  String? time;
  String? name;

  CallModel copyWith({
    String? time,
    String? name,
  }) =>
      CallModel(
        time: time ?? this.time,
        name: name ?? this.name,
      );

  factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
    time: json["time"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "name": name,
  };
}
