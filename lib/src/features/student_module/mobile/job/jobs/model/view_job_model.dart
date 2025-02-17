// To parse this JSON data, do
//
//     final jobResponseModel = jobResponseModelFromJson(jsonString?);

import 'dart:convert';

JobResponseModel jobResponseModelFromJson(String? str) =>
    JobResponseModel.fromJson(json.decode(str!));

String? jobResponseModelToJson(JobResponseModel data) =>
    json.encode(data.toJson());

class JobResponseModel {
  bool? success;
  String? message;
  int? error;
  List<JobModel>? data;

  JobResponseModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory JobResponseModel.fromJson(Map<String?, dynamic> json) =>
      JobResponseModel(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<JobModel>.from(
                json["data"].map((x) => JobModel.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class JobModel {
  int? id;
  String? jobRole;
  String? workExpMin;
  String? workExpMax;
  String? paysalary;
  String? workLocation;
  String? jobDescription;
  int? userId;
  String? time;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isApplied;
  int? isSelected;
  int? isSaved;
  List<UserDetail>? user;
  int? totalUserApplied;

  JobModel({
    this.id,
    this.jobRole,
    this.workExpMin,
    this.workExpMax,
    this.paysalary,
    this.workLocation,
    this.jobDescription,
    this.userId,
    this.time,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isApplied,
    this.isSelected,
    this.isSaved,
    this.user,
    this.totalUserApplied,
  });

  factory JobModel.fromJson(Map<String?, dynamic> json) => JobModel(
        id: json["id"],
        jobRole: json["job_role"],
        workExpMin: json["work_exp_min"],
        workExpMax: json["work_exp_max"],
        paysalary: json["paysalary"],
        workLocation: json["work_location"],
        jobDescription: json["job_description"],
        userId: json["user_id"],
        time: json["time"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isApplied: json["isApplied"],
        isSelected: json["isSelected"],
        isSaved: json["isSaved"],
        user: json["user"] == null
            ? []
            : List<UserDetail>.from(
                json["user"].map((x) => UserDetail.fromJson(x))),
        totalUserApplied: json["total_user_applied"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "job_role": jobRole,
        "work_exp_min": workExpMin,
        "work_exp_max": workExpMax,
        "paysalary": paysalary,
        "work_location": workLocation,
        "job_description": jobDescription,
        "user_id": userId,
        "time": time,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "isApplied": isApplied,
        "isSelected": isSelected,
        "isSaved": isSaved,
        "user": List<dynamic>.from(user!.map((x) => x.toJson())),
        "total_user_applied": totalUserApplied,
      };
}

class UserDetail {
  int? appliedBy;
  int? isSelected;
  int? id;
  String? username;
  String? password;
  int? userType;
  String? address;
  String? phone;
  dynamic empId;
  dynamic registrationNo;
  int? isActive;
  int? isVerified;
  String? uuid;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDetail({
    this.appliedBy,
    this.isSelected,
    this.id,
    this.username,
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
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        appliedBy: json["applied_by"],
        isSelected: json["isSelected"],
        id: json["id"],
        username: json["username"],
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
      );

  Map<String, dynamic> toJson() => {
        "applied_by": appliedBy,
        "isSelected": isSelected,
        "id": id,
        "username": username,
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
      };
}
