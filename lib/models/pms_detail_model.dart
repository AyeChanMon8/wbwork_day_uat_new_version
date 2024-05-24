// @dart=2.9

import 'package:winbrother_hr_app/models/key_performance_attachment_ids.dart';
import 'package:winbrother_hr_app/models/pms_attachments.dart';
import 'package:winbrother_hr_app/models/rating_config.dart';

/// id : 15
/// name : "PE014"
/// state : "draft"
/// employee_id : {"id":6115,"name":"Ahr Yu"}
/// template_id : {"id":3,"name":"Sales Team"}
/// comp_template_id : {"id":2,"name":"A3 – Acceptability (လက်ခံနိုင်မှု)"}
/// mid_from_date : null
/// mid_to_date : null
/// end_from_date : null
/// end_to_date : null
/// date_range_id : {"id":5,"name":"2020-2021 Objective"}
/// date_start : "2020-10-01"
/// date_end : "2021-09-30"
/// deadline : "2021-01-16"
/// key_performance_ids : [{"id":58,"name":"Car","description":"Driving skil","weightage":0,"employee_rate":0,"employee_remark":null,"manager_rate":0,"manager_remark":null},{"id":59,"name":"Sales Amount","description":"Sale","weightage":0,"employee_rate":0,"employee_remark":null,"manager_rate":0,"manager_remark":null},{"id":60,"name":"Marketing","description":"Marketing","weightage":0,"employee_rate":0,"employee_remark":null,"manager_rate":0,"manager_remark":null}]
/// competencies_ids : [{"id":46,"name":"Teamwork","description":"Interacts effectively and builds respectful relationships within and between units and among individuals.","score":0,"comment":null},{"id":47,"name":"Adherence to Policy","description":"Follows rules of conduct, safety rules, other regulations, and adheres to company policies and procedures.","score":0,"comment":null},{"id":48,"name":"Execuation (PDCA)","description":"Carrying out of a plan, order, or course of action.","score":0,"comment":null},{"id":49,"name":"Management","description":"The process of dealing with or controlling things or people.","score":0,"comment":null},{"id":50,"name":"Collaboration","description":"The action of working with someone to produce something","score":0,"comment":null},{"id":51,"name":"360-degree feedback","description":"feedback from an employee's subordinates, colleagues, and supervisor(s)","score":0,"comment":null}]

class PMSDetailModel {
  int _id;
  String _name;
  String _state;
  Employee_id _employeeId;
  Template_id _templateId;
  Comp_template_id _compTemplateId;
  String _midFromDate;
  String _midToDate;
  String _endFromDate;
  String _endToDate;
  Date_range_id _dateRangeId;
  String _dateStart;
  String _dateEnd;
  // String _deadline;
  List<Key_performance_ids> _keyPerformanceIds;
  // List<KeyPerformanceAttachmentIds> _keyPerformanceAttachmentIds;
  List<Competencies_ids> _competenciesIds;
  Employee_id _job_id;
  double _competency_score;
  double _mid_competency_score;
  // double _kpi;
  // double _mid_kpi;
  int _what_final_rating;
  int _how_final_rating;
  // bool _is_submitted;
  FinalRating _final_evaluation_rating;
  String _final_evaluation_description;

  int get id => _id;
  // bool get is_submitted => _is_submitted;
  String get name => _name;
  String get state => _state;
  Employee_id get employeeId => _employeeId;
  Template_id get templateId => _templateId;
  Comp_template_id get compTemplateId => _compTemplateId;
  String get midFromDate => _midFromDate;
  String get midToDate => _midToDate;
  String get endFromDate => _endFromDate;
  String get endToDate => _endToDate;
  Date_range_id get dateRangeId => _dateRangeId;
  String get dateStart => _dateStart;
  String get dateEnd => _dateEnd;
  // String get deadline => _deadline ?? '';
  List<Key_performance_ids> get keyPerformanceIds => _keyPerformanceIds;
  // List<KeyPerformanceAttachmentIds> get keyPerformanceAttachmentIds =>
  //     _keyPerformanceAttachmentIds;
  List<Competencies_ids> get competenciesIds => _competenciesIds;
  // double get kpi => _kpi;
  // double get mid_kpi => _mid_kpi;
  double get competency_score => _competency_score;
  double get mid_competency_score => _mid_competency_score;
  int get how_final_rating => _how_final_rating;
  int get what_final_rating => _what_final_rating;
  Employee_id get job_id => _job_id;
  FinalRating get final_evaluation_rating => _final_evaluation_rating;
  String get final_evaluation_description => _final_evaluation_description;

  PMSDetailModel(
      {int id,
      String name,
      String state,
      Employee_id employeeId,
      Template_id templateId,
      Comp_template_id compTemplateId,
      String midFromDate,
      String midToDate,
      String endFromDate,
      String endToDate,
      Date_range_id dateRangeId,
      String dateStart,
      String dateEnd,
      // String deadline,
      List<Key_performance_ids> keyPerformanceIds,
      List<Competencies_ids> competenciesIds,
      // double kpi,
      // double mid_kpi,
      double competency_score,
      double mid_competency_score,
      int what_final_rating,
      int how_final_rating,
      FinalRating final_evaluation_rating,
      String final_evaluation_description}) {
    _id = id;
    _name = name;
    _state = state;
    _employeeId = employeeId;
    _templateId = templateId;
    _compTemplateId = compTemplateId;
    _midFromDate = midFromDate;
    _midToDate = midToDate;
    _endFromDate = endFromDate;
    _endToDate = endToDate;
    _dateRangeId = dateRangeId;
    _dateStart = dateStart;
    _dateEnd = dateEnd;
    // _deadline = deadline;
    _keyPerformanceIds = keyPerformanceIds;
    // _keyPerformanceAttachmentIds = keyPerformanceAttachmentIds;
    _competenciesIds = competenciesIds;
    // _kpi = kpi;
    // _mid_kpi = mid_kpi;
    _competency_score = competency_score;
    _mid_competency_score = mid_competency_score;
    _what_final_rating = what_final_rating;
    _how_final_rating = how_final_rating;
    _final_evaluation_rating = final_evaluation_rating;
    _final_evaluation_description = final_evaluation_description;
  }

  PMSDetailModel.name();

  PMSDetailModel.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"] ?? '';
    _state = json["state"] ?? "draft";
    _employeeId = json["employee_id"] != null
        ? Employee_id.fromJson(json["employee_id"])
        : null;
    _templateId = json["performance_template_id"] != null
        ? Template_id.fromJson(json["performance_template_id"])
        : null;
    _compTemplateId = json["competencies_template_id"] != null
        ? Comp_template_id.fromJson(json["competencies_template_id"])
        : null;
    _midFromDate = json["mid_from_date"];
    _midToDate = json["mid_to_date"];
    _endFromDate = json["end_from_date"];
    _endToDate = json["end_to_date"];
    _dateRangeId = json["date_range_id"] != null
        ? Date_range_id.fromJson(json["date_range_id"])
        : null;
    _dateStart = json["date_start"];
    _dateEnd = json["date_end"];
    // _deadline = json["deadline"];

    _competency_score = json["competency_score"];
    _mid_competency_score = json["mid_competency_score"];
    // _kpi = json["kpi"];
    // _mid_kpi = json["mid_kpi"];
    _what_final_rating = json["what_final_rating"];
    _how_final_rating = json["how_final_rating"];
    // _is_submitted = json["is_submitted"] == null ? false : json["is_submitted"];
    _job_id =
        json["job_id"] != null ? Employee_id.fromJson(json["job_id"]) : null;

    if (json["key_performance_ids"] != null) {
      _keyPerformanceIds = [];
      json["key_performance_ids"].forEach((v) {
        _keyPerformanceIds.add(Key_performance_ids.fromJson(v));
      });
    }
    // if (json["key_performance_attachment_ids"] != null) {
    //   _keyPerformanceAttachmentIds = [];
    //   json["key_performance_attachment_ids"].forEach((v) {
    //     _keyPerformanceAttachmentIds.add(KeyPerformanceAttachmentIds.fromMap(v));
    //   });
    // }else{
    //   _keyPerformanceAttachmentIds = [];
    // }
    if (json["key_competencies_ids"] != null) {
      _competenciesIds = [];
      json["key_competencies_ids"].forEach((v) {
        _competenciesIds.add(Competencies_ids.fromJson(v));
      });
    }
    // _final_evaluation_rating = json['final_evaluation_rating'];
    _final_evaluation_rating = json["final_evaluation_rating"] != null ? FinalRating.fromJson(json["final_evaluation_rating"]) : null;
    _final_evaluation_description = json['final_evaluation_description'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["state"] = _state;
    if (_employeeId != null) {
      map["employee_id"] = _employeeId.toJson();
    }
    if (_templateId != null) {
      map["performance_template_id"] = _templateId.toJson();
    }
    if (_compTemplateId != null) {
      map["competencies_template_id"] = _compTemplateId.toJson();
    }
    map["mid_from_date"] = _midFromDate;
    map["mid_to_date"] = _midToDate;
    map["end_from_date"] = _endFromDate;
    map["end_to_date"] = _endToDate;
    if (_dateRangeId != null) {
      map["date_range_id"] = _dateRangeId.toJson();
    }
    map["what_final_rating"] = _what_final_rating;
    map["date_start"] = _dateStart;
    map["date_end"] = _dateEnd;
    // map["deadline"] = _deadline;
    if (_keyPerformanceIds != null) {
      map["key_performance_ids"] =
          _keyPerformanceIds.map((v) => v.toJson()).toList();
    }
    // if (_keyPerformanceAttachmentIds != null) {
    //   map["key_performance_attachment_ids"] =
    //       _keyPerformanceAttachmentIds.map((v) => v.toMap()).toList();
    // }
    if (_competenciesIds != null) {
      map["key_competencies_ids"] =
          _competenciesIds.map((v) => v.toJson()).toList();
    }
    if (_final_evaluation_rating != null) {
      map["final_evaluation_rating"] = _final_evaluation_rating.toJson();
    }
    map["_final_evaluation_description"] = _final_evaluation_description;
    return map;
  }

  String startDate() {
    if (endFromDate != null &&
        DateTime.now().isAfter(DateTime.parse(midFromDate)))
      return endFromDate;
    else if (midFromDate != null) {
      return midFromDate;
    }
    return dateStart;
  }

  String endDate() {
    if (endToDate != null && DateTime.now().isAfter(DateTime.parse(midToDate)))
      return endToDate;
    else if (midToDate != null) {
      return midToDate;
    }
    return dateEnd;
  }
}

/// id : 46
/// name : "Teamwork"
/// description : "Interacts effectively and builds respectful relationships within and between units and among individuals."
/// score : 0
/// comment : null

class Competencies_ids {
  int _id;
  String _name;
  String _description;
  double _score;
  dynamic _comment;
  Rating _rating;
  Rating _employee_rating;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  double get score => _score;
  Rating get rating => _rating;
  Rating get employee_rating => _employee_rating;
  void setScore(double score) {
    _score = score;
  }

  dynamic get comment => _comment ?? '';
  void setComment(String comment) {
    _comment = comment;
  }

  Competencies_ids(
      {int id,
      String name,
      String description,
      double score,
      dynamic comment,
      Rating rating,
      Rating employee_rating,
      }) {
    _id = id;
    _name = name;
    _description = description;
    _score = score;
    _comment = comment;
    _rating = rating;
    _employee_rating = employee_rating;
  }

  Competencies_ids.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _description = json["description"];
    _score = json["score"];
    _comment = json["comment"];
    _rating = json["rating"] != null ? Rating.fromJson(json["rating"]) : null;
    _employee_rating = json["employee_rating"] != null ? Rating.fromJson(json["employee_rating"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["score"] = _score;
    map["comment"] = _comment;
    if (_rating != null) {
      map["rating"] = _rating.toJson();
    }
    if (_employee_rating != null) {
      map["employee_rating"] = _employee_rating.toJson();
    }
    return map;
  }
}

/// id : 58
/// name : "Car"
/// description : "Driving skil"
/// weightage : 0
/// employee_rate : 0
/// employee_remark : null
/// manager_rate : 0
/// manager_remark : null

class Key_performance_ids {
  int _id;
  String _name;
  String _description;
  int _weightage;
  double _employeeRate;
  dynamic _employeeRemark;
  double _managerRate;
  dynamic _managerRemark;
  Rating _employeeRating;
  Rating _managerRating;
  List<PMSattachments> _attachmentIds;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  int get weightage => _weightage;
  double get employeeRate => _employeeRate;
  Rating get employeeRating => _employeeRating;
  Rating get managerRating => _managerRating;
  List<PMSattachments> get attachmentIds => _attachmentIds;
  void setemployeeRate(double rate) {
    _employeeRate = rate;
  }

  dynamic get employeeRemark => _employeeRemark ?? '';
  void setemployeeRemark(String remark) {
    _employeeRemark = remark;
  }

  double get managerRate => _managerRate;
  void setManagerRate(double rate) {
    _managerRate = rate;
  }

  dynamic get managerRemark => _managerRemark ?? '';
  void setManagerRemark(String remark) {
    _managerRemark = remark;
  }

  Key_performance_ids(
      {int id,
      String name,
      String description,
      int weightage,
      double employeeRate,
      dynamic employeeRemark,
      double managerRate,
      dynamic managerRemark,
      List<PMSattachments> attachmentIds,
      Rating employeeRating,
      Rating managerRating}) {
    _id = id;
    _name = name;
    _description = description;
    _weightage = weightage;
    _employeeRate = employeeRate;
    _employeeRemark = employeeRemark;
    _managerRate = managerRate;
    _managerRemark = managerRemark;
    _attachmentIds = attachmentIds;
    _employeeRating = employeeRating;
    _managerRating = managerRating;
  }

  Key_performance_ids.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _description = json["description"];
    _weightage = json["weightage"];
    _employeeRemark = json["employee_remark"];
    _managerRemark = json["manager_remark"];
    _employeeRating = json["employee_rating"] != null ? Rating.fromJson(json["employee_rating"]) : null;
    _managerRating = json["manager_rating"] != null ? Rating.fromJson(json["manager_rating"]) : null;
    if (json["attachment_ids"] != null) {
      _attachmentIds = [];
      json["attachment_ids"].forEach((v) {
        _attachmentIds.add(PMSattachments.fromJson(v));
      });
    }
    // if (json["attachment_ids"] != null) {
    //   _attachmentIds = [];
    //   json["attachment_ids"].forEach((v) {
    //     print("attData");
    //     print(v);
    //     if(v=="false"||v==false){
    //       print("falseData");
    //     }else{
    //       _attachmentIds.add(v);
    //     }

    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["weightage"] = _weightage;
    map["employee_remark"] = _employeeRemark;
    map["manager_remark"] = _managerRemark;
    // map["attachment_ids"] = _attachmentIds;
    if (_attachmentIds != null) {
      map["attachment_ids"] = _attachmentIds.map((v) => v.toJson()).toList();
    }
    if (_employeeRating != null) {
      map["employee_rating"] = _employeeRating.toJson();
    }
    if (_managerRating != null) {
      map["manager_rating"] = _managerRating.toJson();
    }
    return map;
  }
}

class Date_range_id {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name ?? '';

  Date_range_id({int id, String name}) {
    _id = id;
    _name = name;
  }

  Date_range_id.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }
}

/// id : 2
/// name : "A3 – Acceptability (လက်ခံနိုင်မှု)"

class Comp_template_id {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  Comp_template_id({int id, String name}) {
    _id = id;
    _name = name;
  }

  Comp_template_id.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"] ?? "";
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }
}

/// id : 3
/// name : "Sales Team"

class Template_id {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  Template_id({int id, String name}) {
    _id = id;
    _name = name;
  }

  Template_id.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"] ?? '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }
}

/// id : 6115
/// name : "Ahr Yu"

class Employee_id {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  Employee_id({int id, String name}) {
    _id = id;
    _name = name;
  }

  Employee_id.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }
}

class Rating {
  int _id;
  String _rating_description;
  String _name;

  int get id => _id;
  String get rating_description => _rating_description;
  String get name => _name;

  Rating({
      int id, 
      String rating_description,
      String name
      }){
    _id = id;
    _rating_description = rating_description;
    _name = name;
}

  Rating.fromJson(dynamic json) {
    _id = json["id"];
    _rating_description = json["rating_description"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["rating_description"] = _rating_description;
    map["name"] = _name;
    return map;
  }

}

class FinalRating {
  int _id;
  String _final_description;
  String _name;

  int get id => _id;
  String get final_description => _final_description;
  String get name => _name;

  FinalRating({
      int id, 
      String final_description,
      String name
      }){
    _id = id;
    _final_description = final_description;
    _name = name;
}

  FinalRating.fromJson(dynamic json) {
    _id = json["id"];
    _final_description = json["final_description"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["final_description"] = _final_description;
    map["name"] = _name;
    return map;
  }

}
