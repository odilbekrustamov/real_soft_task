import 'dart:convert';

class AutoGenerate {
  late String aud;
  late String jti;
  late int iat;
  late int nbf;
  late int exp;
  late String sub;
  late List<dynamic> scopes;
  late UserInfo userInfo;
  late String clientId;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    aud = json['aud'];
    jti = json['jti'];
    iat = json['iat'];
    nbf = json['nbf'];
    exp = json['exp'];
    sub = json['sub'];
    scopes = List.castFrom<dynamic, dynamic>(json['scopes']);
    userInfo = UserInfo.fromJson(json['user_info']);
    clientId = json['client_id'];
  }
}

class UserInfo {
  late String name;
  late List<Organization> organization;
  late String practitioner;
  late List<String> roles;

  UserInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    organization = List.from(json['organization']).map((e) => Organization.fromJson(e)).toList();
    practitioner = json['practitioner'];
    roles = List.castFrom<dynamic, String>(json['roles']);
  }
}

class Organization {
  late String uuid;
  late String name;
  late bool active;
  late List<PractitionerRole> practitionerRole;

  Organization.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    active = json['active'];
    practitionerRole = List.from(json['practitioner_role']).map((e) => PractitionerRole.fromJson(e)).toList();
  }
}

class PractitionerRole {
  late String uuid;
  late String code;

  PractitionerRole.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    code = json['code'];
  }
}

AutoGenerate decodeJwt(String jwt) {
  final decodedJwt = json.decode(utf8.decode(base64Url.decode(base64Url.normalize(jwt.split('.')[1]))));
  return AutoGenerate.fromJson(decodedJwt);
}