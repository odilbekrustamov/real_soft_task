/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
    Test({
        required this.data,
        required this.timestamp,
        required this.status,
    });

    List<Datum> data;
    DateTime timestamp;
    int status;

    factory Test.fromJson(Map<dynamic, dynamic> json) => Test(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "timestamp": timestamp.toIso8601String(),
        "status": status,
    };
}

class Datum {
    Datum({
        this.needTreatment,
        this.title,
        this.needMedical,
        this.medicalNeedness,
        this.familyMemberNotebook,
        this.socialHelpNeed,
        this.abroadWorkFamily,
        this.value,
        this.need,
        this.label,
        this.drinkingWater,
        this.naturalGas,
        this.ngLiquidGas,
        this.ngCoal,
        this.electricity,
        this.eTransformator,
        this.eCabel,
        this.eMercury,
        this.eIllumination,
        this.innerRoads,
        this.irAsphalt,
        this.irConcreteRoad,
        this.irGraveling,
        this.total,
        this.scumbagWater,
        this.internet,
        this.mobileCommunication,
        this.gasHeating,
        this.electricalHeating,
        this.heatingSystem,
        this.localHeating,
        this.aloneHeating,
        this.name,
        this.coal,
        this.fuelHeating,
        this.waste,
        this.homeRemont,
        this.prosperousHouse,
        this.needHelp,
        this.titleTotal,
        this.currentRepair,
    });

    List<AbroadWorkFamily>? needTreatment;
    String? title;
    List<AbroadWorkFamily>? needMedical;
    List<AbroadWorkFamily>? medicalNeedness;
    List<AbroadWorkFamily>? familyMemberNotebook;
    List<SocialHelpNeed>? socialHelpNeed;
    List<AbroadWorkFamily>? abroadWorkFamily;
    int? value;
    List<Need>? need;
    String? label;
    List<AbroadWorkFamily>? drinkingWater;
    List<AbroadWorkFamily>? naturalGas;
    List<AbroadWorkFamily>? ngLiquidGas;
    List<AbroadWorkFamily>? ngCoal;
    List<AbroadWorkFamily>? electricity;
    List<AbroadWorkFamily>? eTransformator;
    List<AbroadWorkFamily>? eCabel;
    List<AbroadWorkFamily>? eMercury;
    List<AbroadWorkFamily>? eIllumination;
    List<AbroadWorkFamily>? innerRoads;
    List<AbroadWorkFamily>? irAsphalt;
    List<AbroadWorkFamily>? irConcreteRoad;
    List<AbroadWorkFamily>? irGraveling;
    int? total;
    List<AbroadWorkFamily>? scumbagWater;
    List<AbroadWorkFamily>? internet;
    List<AbroadWorkFamily>? mobileCommunication;
    List<AbroadWorkFamily>? gasHeating;
    List<AbroadWorkFamily>? electricalHeating;
    List<AbroadWorkFamily>? heatingSystem;
    List<AbroadWorkFamily>? localHeating;
    List<AbroadWorkFamily>? aloneHeating;
    String? name;
    List<AbroadWorkFamily>? coal;
    List<AbroadWorkFamily>? fuelHeating;
    List<AbroadWorkFamily>? waste;
    List<AbroadWorkFamily>? homeRemont;
    List<AbroadWorkFamily>? prosperousHouse;
    List<NeedHelp>? needHelp;
    int? titleTotal;
    List<AbroadWorkFamily>? currentRepair;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        needTreatment: json["need_treatment"] == null ? [] : List<AbroadWorkFamily>.from(json["need_treatment"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        title: json["title"],
        needMedical: json["need_medical"] == null ? [] : List<AbroadWorkFamily>.from(json["need_medical"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        medicalNeedness: json["medical_needness"] == null ? [] : List<AbroadWorkFamily>.from(json["medical_needness"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        familyMemberNotebook: json["family_member_notebook"] == null ? [] : List<AbroadWorkFamily>.from(json["family_member_notebook"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        socialHelpNeed: json["social_help_need"] == null ? [] : List<SocialHelpNeed>.from(json["social_help_need"]!.map((x) => SocialHelpNeed.fromJson(x))),
        abroadWorkFamily: json["abroad_work_family"] == null ? [] : List<AbroadWorkFamily>.from(json["abroad_work_family"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        value: json["value"],
        need: json["need"] == null ? [] : List<Need>.from(json["need"]!.map((x) => Need.fromJson(x))),
        label: json["label"],
        drinkingWater: json["drinking_water"] == null ? [] : List<AbroadWorkFamily>.from(json["drinking_water"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        naturalGas: json["natural_gas"] == null ? [] : List<AbroadWorkFamily>.from(json["natural_gas"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        ngLiquidGas: json["ng_liquid_gas"] == null ? [] : List<AbroadWorkFamily>.from(json["ng_liquid_gas"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        ngCoal: json["ng_coal"] == null ? [] : List<AbroadWorkFamily>.from(json["ng_coal"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        electricity: json["electricity"] == null ? [] : List<AbroadWorkFamily>.from(json["electricity"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        eTransformator: json["e_transformator"] == null ? [] : List<AbroadWorkFamily>.from(json["e_transformator"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        eCabel: json["e_cabel"] == null ? [] : List<AbroadWorkFamily>.from(json["e_cabel"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        eMercury: json["e_mercury"] == null ? [] : List<AbroadWorkFamily>.from(json["e_mercury"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        eIllumination: json["e_illumination"] == null ? [] : List<AbroadWorkFamily>.from(json["e_illumination"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        innerRoads: json["inner_roads"] == null ? [] : List<AbroadWorkFamily>.from(json["inner_roads"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        irAsphalt: json["ir_asphalt"] == null ? [] : List<AbroadWorkFamily>.from(json["ir_asphalt"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        irConcreteRoad: json["ir_concrete_road"] == null ? [] : List<AbroadWorkFamily>.from(json["ir_concrete_road"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        irGraveling: json["ir_graveling"] == null ? [] : List<AbroadWorkFamily>.from(json["ir_graveling"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        total: json["total"],
        scumbagWater: json["scumbag_water"] == null ? [] : List<AbroadWorkFamily>.from(json["scumbag_water"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        internet: json["internet"] == null ? [] : List<AbroadWorkFamily>.from(json["internet"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        mobileCommunication: json["mobile_communication"] == null ? [] : List<AbroadWorkFamily>.from(json["mobile_communication"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        gasHeating: json["gas_heating"] == null ? [] : List<AbroadWorkFamily>.from(json["gas_heating"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        electricalHeating: json["electrical_heating"] == null ? [] : List<AbroadWorkFamily>.from(json["electrical_heating"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        heatingSystem: json["heating_system"] == null ? [] : List<AbroadWorkFamily>.from(json["heating_system"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        localHeating: json["local_heating"] == null ? [] : List<AbroadWorkFamily>.from(json["local_heating"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        aloneHeating: json["alone_heating"] == null ? [] : List<AbroadWorkFamily>.from(json["alone_heating"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        name: json["name"],
        coal: json["coal"] == null ? [] : List<AbroadWorkFamily>.from(json["coal"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        fuelHeating: json["fuel_heating"] == null ? [] : List<AbroadWorkFamily>.from(json["fuel_heating"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        waste: json["waste"] == null ? [] : List<AbroadWorkFamily>.from(json["waste"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        homeRemont: json["home_remont"] == null ? [] : List<AbroadWorkFamily>.from(json["home_remont"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        prosperousHouse: json["prosperous_house"] == null ? [] : List<AbroadWorkFamily>.from(json["prosperous_house"]!.map((x) => AbroadWorkFamily.fromJson(x))),
        needHelp: json["need_help"] == null ? [] : List<NeedHelp>.from(json["need_help"]!.map((x) => NeedHelp.fromJson(x))),
        titleTotal: json["title_total"],
        currentRepair: json["current_repair"] == null ? [] : List<AbroadWorkFamily>.from(json["current_repair"]!.map((x) => AbroadWorkFamily.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "need_treatment": needTreatment == null ? [] : List<dynamic>.from(needTreatment!.map((x) => x.toJson())),
        "title": title,
        "need_medical": needMedical == null ? [] : List<dynamic>.from(needMedical!.map((x) => x.toJson())),
        "medical_needness": medicalNeedness == null ? [] : List<dynamic>.from(medicalNeedness!.map((x) => x.toJson())),
        "family_member_notebook": familyMemberNotebook == null ? [] : List<dynamic>.from(familyMemberNotebook!.map((x) => x.toJson())),
        "social_help_need": socialHelpNeed == null ? [] : List<dynamic>.from(socialHelpNeed!.map((x) => x.toJson())),
        "abroad_work_family": abroadWorkFamily == null ? [] : List<dynamic>.from(abroadWorkFamily!.map((x) => x.toJson())),
        "value": value,
        "need": need == null ? [] : List<dynamic>.from(need!.map((x) => x.toJson())),
        "label": label,
        "drinking_water": drinkingWater == null ? [] : List<dynamic>.from(drinkingWater!.map((x) => x.toJson())),
        "natural_gas": naturalGas == null ? [] : List<dynamic>.from(naturalGas!.map((x) => x.toJson())),
        "ng_liquid_gas": ngLiquidGas == null ? [] : List<dynamic>.from(ngLiquidGas!.map((x) => x.toJson())),
        "ng_coal": ngCoal == null ? [] : List<dynamic>.from(ngCoal!.map((x) => x.toJson())),
        "electricity": electricity == null ? [] : List<dynamic>.from(electricity!.map((x) => x.toJson())),
        "e_transformator": eTransformator == null ? [] : List<dynamic>.from(eTransformator!.map((x) => x.toJson())),
        "e_cabel": eCabel == null ? [] : List<dynamic>.from(eCabel!.map((x) => x.toJson())),
        "e_mercury": eMercury == null ? [] : List<dynamic>.from(eMercury!.map((x) => x.toJson())),
        "e_illumination": eIllumination == null ? [] : List<dynamic>.from(eIllumination!.map((x) => x.toJson())),
        "inner_roads": innerRoads == null ? [] : List<dynamic>.from(innerRoads!.map((x) => x.toJson())),
        "ir_asphalt": irAsphalt == null ? [] : List<dynamic>.from(irAsphalt!.map((x) => x.toJson())),
        "ir_concrete_road": irConcreteRoad == null ? [] : List<dynamic>.from(irConcreteRoad!.map((x) => x.toJson())),
        "ir_graveling": irGraveling == null ? [] : List<dynamic>.from(irGraveling!.map((x) => x.toJson())),
        "total": total,
        "scumbag_water": scumbagWater == null ? [] : List<dynamic>.from(scumbagWater!.map((x) => x.toJson())),
        "internet": internet == null ? [] : List<dynamic>.from(internet!.map((x) => x.toJson())),
        "mobile_communication": mobileCommunication == null ? [] : List<dynamic>.from(mobileCommunication!.map((x) => x.toJson())),
        "gas_heating": gasHeating == null ? [] : List<dynamic>.from(gasHeating!.map((x) => x.toJson())),
        "electrical_heating": electricalHeating == null ? [] : List<dynamic>.from(electricalHeating!.map((x) => x.toJson())),
        "heating_system": heatingSystem == null ? [] : List<dynamic>.from(heatingSystem!.map((x) => x.toJson())),
        "local_heating": localHeating == null ? [] : List<dynamic>.from(localHeating!.map((x) => x.toJson())),
        "alone_heating": aloneHeating == null ? [] : List<dynamic>.from(aloneHeating!.map((x) => x.toJson())),
        "name": name,
        "coal": coal == null ? [] : List<dynamic>.from(coal!.map((x) => x.toJson())),
        "fuel_heating": fuelHeating == null ? [] : List<dynamic>.from(fuelHeating!.map((x) => x.toJson())),
        "waste": waste == null ? [] : List<dynamic>.from(waste!.map((x) => x.toJson())),
        "home_remont": homeRemont == null ? [] : List<dynamic>.from(homeRemont!.map((x) => x.toJson())),
        "prosperous_house": prosperousHouse == null ? [] : List<dynamic>.from(prosperousHouse!.map((x) => x.toJson())),
        "need_help": needHelp == null ? [] : List<dynamic>.from(needHelp!.map((x) => x.toJson())),
        "title_total": titleTotal,
        "current_repair": currentRepair == null ? [] : List<dynamic>.from(currentRepair!.map((x) => x.toJson())),
    };
}

class AbroadWorkFamily {
    AbroadWorkFamily({
        required this.total,
        required this.name,
        this.oneDayTotal,
        this.name1,
    });

    int total;
    String name;
    int? oneDayTotal;
    String? name1;

    factory AbroadWorkFamily.fromJson(Map<dynamic, dynamic> json) => AbroadWorkFamily(
        total: json["total"],
        name: json["name"],
        oneDayTotal: json["one_day_total"],
        name1: json["name1"],
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "name": name,
        "one_day_total": oneDayTotal,
        "name1": name1,
    };
}

class Need {
    Need({
        required this.total,
        required this.title,
    });

    int total;
    String title;

    factory Need.fromJson(Map<dynamic, dynamic> json) => Need(
        total: json["total"],
        title: json["title"],
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "title": title,
    };
}

class NeedHelp {
    NeedHelp({
        required this.titleTotal,
        required this.title,
    });

    int titleTotal;
    String title;

    factory NeedHelp.fromJson(Map<dynamic, dynamic> json) => NeedHelp(
        titleTotal: json["title_total"],
        title: json["title"],
    );

    Map<dynamic, dynamic> toJson() => {
        "title_total": titleTotal,
        "title": title,
    };
}

class SocialHelpNeed {
    SocialHelpNeed({
        required this.title,
        required this.value,
    });

    String title;
    int value;

    factory SocialHelpNeed.fromJson(Map<dynamic, dynamic> json) => SocialHelpNeed(
        title: json["title"],
        value: json["value"],
    );

    Map<dynamic, dynamic> toJson() => {
        "title": title,
        "value": value,
    };
}
