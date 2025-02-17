import 'dart:convert';

import 'package:all_in_one3/src/features/common_features/profile/model/profile_response_model.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';

EmployeeModelResponse employeeModelResponseFromJson(String? str) =>
    EmployeeModelResponse.fromJson(json.decode(str!));

String? employeeModelResponseToJson(EmployeeModelResponse data) =>
    json.encode(data.toJson());

class EmployeeModelResponse {
  bool? success;
  int? error;
  String? message;
  List<EmployeeModel>? data;

  EmployeeModelResponse({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  factory EmployeeModelResponse.fromJson(Map<String, dynamic> json) =>
      EmployeeModelResponse(
        success: json["success"],
        error: json["error"],
        message: json["message"],
        data: List<EmployeeModel>.from(
            json["data"].map((x) => EmployeeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EmployeeModel {
  int? id;
  String? username;
  String? image;
  String? password;
  int? userType;
  String? address;
  String? phone;
  String? empId;
  dynamic registrationNo;
  int? isActive;
  int? isVerified;
  dynamic uuid;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  String? name;
  int? companyId;
  String? degination;
  String? onSiteEmail;
  String? resume;
  String? descripton;
  String? keySkill;
  List<UserSkill>? userSkill;
  List<CourseModel>? assignCourse;
  EmployeeModel({
    this.id,
    this.username,
    this.image,
    this.password,
    this.userType,
    this.address,
    this.phone,
    this.empId,
    this.registrationNo,
    this.isActive,
    this.isVerified,
    this.uuid,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.name,
    this.companyId,
    this.degination,
    this.onSiteEmail,
    this.resume,
    this.descripton,
    this.keySkill,
    this.userSkill,
    this.assignCourse,
  });

  factory EmployeeModel.fromJson(Map<String?, dynamic> json) => EmployeeModel(
        id: json["id"],
        username: json["username"],
        image: json["image"],
        password: json["password"],
        userType: json["user_type"],
        address: json["address"],
        phone: json["phone"],
        empId: json["emp_id"],
        registrationNo: json["registration_no"],
        isActive: json["is_active"],
        isVerified: json["is_verified"],
        uuid: json["uuid"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["user_id"],
        name: json["name"],
        companyId: json["company_id"],
        degination: json["degination"],
        onSiteEmail: json["on_site_email"],
        resume: json["resume"],
        descripton: json["descripton"],
        keySkill: json["key_skill"],
        userSkill: json["skill"] == null
            ? []
            : List<UserSkill>.from(
                json["skill"].map((x) => UserSkill.fromJson(x))),
        assignCourse: json["assign_course"] == null
            ? []
            : List<CourseModel>.from(
                json["assign_course"].map((x) => CourseModel.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "username": username,
        "image": image,
        "password": password,
        "user_type": userType,
        "address": address,
        "phone": phone,
        "emp_id": empId,
        "registration_no": registrationNo,
        "is_active": isActive,
        "is_verified": isVerified,
        "uuid": uuid,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "user_id": userId,
        "name": name,
        "company_id": companyId,
        "degination": degination,
        "on_site_email": onSiteEmail,
        "resume": resume,
        "descripton": descripton,
        "key_skill": keySkill,
        "skill": userSkill,
        "assign_course":
            List<dynamic>.from(assignCourse!.map((x) => x.toJson())),
      };
}
