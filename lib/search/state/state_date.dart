/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

StateDate stateDateFromJson(String str) => StateDate.fromJson(json.decode(str));

String stateDateToJson(StateDate data) => json.encode(data.toJson());

class StateDate {
    StateDate({
        required this.data,
        required this.timestamp,
        required this.status,
    });

    List<Datum> data;
    String timestamp;
    int status;

    factory StateDate.fromJson(Map<dynamic, dynamic> json) => StateDate(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        timestamp: json["timestamp"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "timestamp": timestamp,
        "status": status,
    };
}

class Datum {
    Datum({
        required this.name,
        required this.id,
    });

    String name;
    int id;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        name: json["name"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
