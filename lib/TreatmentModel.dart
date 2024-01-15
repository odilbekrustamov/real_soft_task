class TreatmentModel {
  dynamic? error;
  dynamic? message;
  String? timestamp;
  num? status;
  dynamic? path;
  List<Data>? data;
  dynamic? response;

  TreatmentModel({
    this.error,
    this.message,
    this.timestamp,
    this.status,
    this.path,
    this.data,
    this.response,
  });

  TreatmentModel.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    timestamp = json['timestamp'];
    status = json['status'];
    path = json['path'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    map['timestamp'] = timestamp;
    map['status'] = status;
    map['path'] = path;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    map['response'] = response;
    return map;
  }
}

class Data {
  String? title;
  List<NeedTreatment>? needTreatment;

  Data({
    this.title,
    this.needTreatment,
  }); // Add a semicolon here

  Data.fromJson(dynamic json) {
    title = json['title'];
    if (json['need_treatment'] != null) {
      needTreatment = [];
      json['need_treatment'].forEach((v) {
        needTreatment!.add(NeedTreatment.fromJson(v));
      });
    }else if (json['need_medical'] != null) {
      needTreatment = [];
      json['need_medical'].forEach((v) {
        needTreatment!.add(NeedTreatment.fromJson(v));
      });
    }else if (json['medical_needness'] != null) {
      needTreatment = [];
      json['medical_needness'].forEach((v) {
        needTreatment!.add(NeedTreatment.fromJson(v));
      });
    }else if (json['family_member_notebook'] != null) {
      needTreatment = [];
      json['family_member_notebook'].forEach((v) {
        needTreatment!.add(NeedTreatment.fromJson(v));
      });
    }else if (json['social_help_need'] != null) {
      needTreatment = [];
      json['social_help_need'].forEach((v) {
        needTreatment!.add(NeedTreatment.fromJson(v));
      });
    }else if (json['abroad_work_family'] != null) {
      needTreatment = [];
      json['abroad_work_family'].forEach((v) {
        needTreatment!.add(NeedTreatment.fromJson(v));
      });
    }else if (json['need'] != null) {
      needTreatment = [];
      json['need'].forEach((v) {
        needTreatment!.add(NeedTreatment.fromJson(v));
      });
    }else if (json['need_treatment'] != null) {
      needTreatment = [];
      json['need_treatment'].forEach((v) {
        needTreatment!.add(NeedTreatment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    if (needTreatment != null) {
      map['need_treatment'] = needTreatment!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}


class NeedTreatment {
  NeedTreatment({
    this.name,
    this.total,
    this.oneDayTotal,
  });

  NeedTreatment.fromJson(dynamic json) {
    name = json['name'];
    total = json['total'];
    oneDayTotal = json['one_day_total'];
  }

  String? name;
  num? total;
  num? oneDayTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['total'] = total;
    map['one_day_total'] = oneDayTotal;
    return map;
  }
}
