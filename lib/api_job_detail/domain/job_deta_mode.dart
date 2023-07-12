// To parse this JSON data, do
//
//     final jobDetailModel = jobDetailModelFromJson(jsonString);

import 'dart:convert';

JobDetailModel jobDetailModelFromJson(String str) =>
    JobDetailModel.fromJson(json.decode(str));

String jobDetailModelToJson(JobDetailModel data) => json.encode(data.toJson());

class JobDetailModel {
  Response response;
  String result;
  bool showMessage;
  int status;

  JobDetailModel({
    required this.response,
    required this.result,
    required this.showMessage,
    required this.status,
  });

  factory JobDetailModel.fromJson(Map<String, dynamic> json) => JobDetailModel(
        response: Response.fromJson(json["response"]),
        result: json["result"],
        showMessage: json["show_message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "result": result,
        "show_message": showMessage,
        "status": status,
      };
}

class Response {
  String message;
  Details details;

  Response({
    required this.message,
    required this.details,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        message: json["message"],
        details: Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "details": details.toJson(),
      };
}

class Details {
  int id;
  List<String> jobTypes;
  List<dynamic> workingDays;
  List<dynamic> skills;
  Employer employer;
  Staff staff;
  dynamic jobLocation;
  String jobCode;
  String activationStatus;
  String title;
  String titleAlt;
  String description;
  String lastDateToApply;
  String locationOption;
  String jobTag;
  int noOfVaccancies;
  DateTime postedOn;
  int postedAt;
  int minSalary;
  int maxSalary;
  String salaryCycle;
  dynamic timingFrom;
  dynamic timingTo;
  bool status;
  String url;
  bool experienceRequired;
  dynamic experienceFrom;
  dynamic experienceTo;
  dynamic experienceType;
  String startDate;
  String joiningTime;
  bool applyFlag;
  bool savedFlag;
  int appliedCount;
  int interestedJobCount;
  int acceptedCount;
  int rejectedCount;
  bool salaryNegotiable;
  dynamic reasonRejected;
  dynamic reasonUncleared;
  dynamic reasonDeactivated;
  int totalApplicantCount;
  dynamic reasonChecksRejected;
  dynamic reasonChecksDeactivated;
  dynamic reasonChecksUncleared;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic district;
  String jobCategory;
  dynamic sortedWorkingDays;

  Details({
    required this.id,
    required this.jobTypes,
    required this.workingDays,
    required this.skills,
    required this.employer,
    required this.staff,
    this.jobLocation,
    required this.jobCode,
    required this.activationStatus,
    required this.title,
    required this.titleAlt,
    required this.description,
    required this.lastDateToApply,
    required this.locationOption,
    required this.jobTag,
    required this.noOfVaccancies,
    required this.postedOn,
    required this.postedAt,
    required this.minSalary,
    required this.maxSalary,
    required this.salaryCycle,
    this.timingFrom,
    this.timingTo,
    required this.status,
    required this.url,
    required this.experienceRequired,
    this.experienceFrom,
    this.experienceTo,
    this.experienceType,
    required this.startDate,
    required this.joiningTime,
    required this.applyFlag,
    required this.savedFlag,
    required this.appliedCount,
    required this.interestedJobCount,
    required this.acceptedCount,
    required this.rejectedCount,
    required this.salaryNegotiable,
    this.reasonRejected,
    this.reasonUncleared,
    this.reasonDeactivated,
    required this.totalApplicantCount,
    this.reasonChecksRejected,
    this.reasonChecksDeactivated,
    this.reasonChecksUncleared,
    required this.createdAt,
    required this.updatedAt,
    this.district,
    required this.jobCategory,
    this.sortedWorkingDays,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        jobTypes: List<String>.from(json["jobTypes"].map((x) => x)),
        workingDays: List<dynamic>.from(json["workingDays"].map((x) => x)),
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        employer: Employer.fromJson(json["employer"]),
        staff: Staff.fromJson(json["staff"]),
        jobLocation: json["jobLocation"],
        jobCode: json["jobCode"],
        activationStatus: json["activation_status"],
        title: json["title"],
        titleAlt: json["title_alt"],
        description: json["description"],
        lastDateToApply: json["lastDateToApply"],
        locationOption: json["locationOption"],
        jobTag: json["jobTag"],
        noOfVaccancies: json["noOfVaccancies"],
        postedOn: DateTime.parse(json["postedOn"]),
        postedAt: json["postedAt"],
        minSalary: json["minSalary"],
        maxSalary: json["maxSalary"],
        salaryCycle: json["salary_cycle"],
        timingFrom: json["timingFrom"],
        timingTo: json["timingTo"],
        status: json["status"],
        url: json["url"],
        experienceRequired: json["experienceRequired"],
        experienceFrom: json["experienceFrom"],
        experienceTo: json["experienceTo"],
        experienceType: json["experienceType"],
        startDate: json["startDate"],
        joiningTime: json["joiningTime"],
        applyFlag: json["applyFlag"],
        savedFlag: json["savedFlag"],
        appliedCount: json["appliedCount"],
        interestedJobCount: json["interestedJobCount"],
        acceptedCount: json["acceptedCount"],
        rejectedCount: json["rejectedCount"],
        salaryNegotiable: json["salaryNegotiable"],
        reasonRejected: json["reason_rejected"],
        reasonUncleared: json["reason_uncleared"],
        reasonDeactivated: json["reason_deactivated"],
        totalApplicantCount: json["totalApplicantCount"],
        reasonChecksRejected: json["reason_checks_rejected"],
        reasonChecksDeactivated: json["reason_checks_deactivated"],
        reasonChecksUncleared: json["reason_checks_uncleared"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        district: json["district"],
        jobCategory: json["jobCategory"],
        sortedWorkingDays: json["sortedWorkingDays"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobTypes": List<dynamic>.from(jobTypes.map((x) => x)),
        "workingDays": List<dynamic>.from(workingDays.map((x) => x)),
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "employer": employer.toJson(),
        "staff": staff.toJson(),
        "jobLocation": jobLocation,
        "jobCode": jobCode,
        "activation_status": activationStatus,
        "title": title,
        "title_alt": titleAlt,
        "description": description,
        "lastDateToApply": lastDateToApply,
        "locationOption": locationOption,
        "jobTag": jobTag,
        "noOfVaccancies": noOfVaccancies,
        "postedOn": postedOn.toIso8601String(),
        "postedAt": postedAt,
        "minSalary": minSalary,
        "maxSalary": maxSalary,
        "salary_cycle": salaryCycle,
        "timingFrom": timingFrom,
        "timingTo": timingTo,
        "status": status,
        "url": url,
        "experienceRequired": experienceRequired,
        "experienceFrom": experienceFrom,
        "experienceTo": experienceTo,
        "experienceType": experienceType,
        "startDate": startDate,
        "joiningTime": joiningTime,
        "applyFlag": applyFlag,
        "savedFlag": savedFlag,
        "appliedCount": appliedCount,
        "interestedJobCount": interestedJobCount,
        "acceptedCount": acceptedCount,
        "rejectedCount": rejectedCount,
        "salaryNegotiable": salaryNegotiable,
        "reason_rejected": reasonRejected,
        "reason_uncleared": reasonUncleared,
        "reason_deactivated": reasonDeactivated,
        "totalApplicantCount": totalApplicantCount,
        "reason_checks_rejected": reasonChecksRejected,
        "reason_checks_deactivated": reasonChecksDeactivated,
        "reason_checks_uncleared": reasonChecksUncleared,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "district": district,
        "jobCategory": jobCategory,
        "sortedWorkingDays": sortedWorkingDays,
      };
}

class Employer {
  int id;
  String code;
  String name;
  dynamic pin;
  String contact;
  String altContact;
  String email;
  String regNumber;
  String employerType;
  String url;
  bool status;
  String logo;
  DateTime createdAt;
  DateTime updatedAt;
  String username;
  String addressLine1;
  String addressLine2;
  bool emailVerified;
  bool contactVerified;
  dynamic city;
  dynamic company;

  Employer({
    required this.id,
    required this.code,
    required this.name,
    this.pin,
    required this.contact,
    required this.altContact,
    required this.email,
    required this.regNumber,
    required this.employerType,
    required this.url,
    required this.status,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.addressLine1,
    required this.addressLine2,
    required this.emailVerified,
    required this.contactVerified,
    this.city,
    this.company,
  });

  factory Employer.fromJson(Map<String, dynamic> json) => Employer(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        pin: json["pin"],
        contact: json["contact"],
        altContact: json["alt_contact"],
        email: json["email"],
        regNumber: json["reg_number"],
        employerType: json["employer_type"],
        url: json["url"],
        status: json["status"],
        logo: json["logo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        emailVerified: json["emailVerified"],
        contactVerified: json["contactVerified"],
        city: json["city"],
        company: json["company"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "pin": pin,
        "contact": contact,
        "alt_contact": altContact,
        "email": email,
        "reg_number": regNumber,
        "employer_type": employerType,
        "url": url,
        "status": status,
        "logo": logo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "emailVerified": emailVerified,
        "contactVerified": contactVerified,
        "city": city,
        "company": company,
      };
}

class Staff {
  int id;
  dynamic city;
  AccessType accessType;
  String fullName;
  String gender;
  String photo;
  dynamic dob;
  String code;
  dynamic appointedOn;
  dynamic position;
  dynamic placeOfWork;
  int approvedCount;
  int unclearedCount;
  int rejectedCount;
  String contact;
  String email;
  String address;
  String pin;
  DateTime lastActive;
  DateTime lastLogin;
  bool live;
  bool loginEnable;

  Staff({
    required this.id,
    this.city,
    required this.accessType,
    required this.fullName,
    required this.gender,
    required this.photo,
    this.dob,
    required this.code,
    this.appointedOn,
    this.position,
    this.placeOfWork,
    required this.approvedCount,
    required this.unclearedCount,
    required this.rejectedCount,
    required this.contact,
    required this.email,
    required this.address,
    required this.pin,
    required this.lastActive,
    required this.lastLogin,
    required this.live,
    required this.loginEnable,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        id: json["id"],
        city: json["city"],
        accessType: AccessType.fromJson(json["accessType"]),
        fullName: json["fullName"],
        gender: json["gender"],
        photo: json["photo"],
        dob: json["dob"],
        code: json["code"],
        appointedOn: json["appointedOn"],
        position: json["position"],
        placeOfWork: json["placeOfWork"],
        approvedCount: json["approvedCount"],
        unclearedCount: json["unclearedCount"],
        rejectedCount: json["rejectedCount"],
        contact: json["contact"],
        email: json["email"],
        address: json["address"],
        pin: json["pin"],
        lastActive: DateTime.parse(json["lastActive"]),
        lastLogin: DateTime.parse(json["last_login"]),
        live: json["live"],
        loginEnable: json["loginEnable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "accessType": accessType.toJson(),
        "fullName": fullName,
        "gender": gender,
        "photo": photo,
        "dob": dob,
        "code": code,
        "appointedOn": appointedOn,
        "position": position,
        "placeOfWork": placeOfWork,
        "approvedCount": approvedCount,
        "unclearedCount": unclearedCount,
        "rejectedCount": rejectedCount,
        "contact": contact,
        "email": email,
        "address": address,
        "pin": pin,
        "lastActive": lastActive.toIso8601String(),
        "last_login": lastLogin.toIso8601String(),
        "live": live,
        "loginEnable": loginEnable,
      };
}

class AccessType {
  int id;
  List<String> permissions;
  String name;

  AccessType({
    required this.id,
    required this.permissions,
    required this.name,
  });

  factory AccessType.fromJson(Map<String, dynamic> json) => AccessType(
        id: json["id"],
        permissions: List<String>.from(json["permissions"].map((x) => x)),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
        "name": name,
      };
}
