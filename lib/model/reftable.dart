class RefTable {
  final int? uid;
  final String? code;
  final String? description;
  final bool? active;
  final String? iClass;
  final String? refType;
  final bool? keepStock;
  final String? companyCode;
  final String? branchCode;
  final String? locationCode;
  final String? userID;
  final String? updatedUID;
  final DateTime? created;
  final DateTime? updated;

  RefTable(
      {this.active,
      this.branchCode,
      this.code,
      this.companyCode,
      this.created,
      this.description,
      this.iClass,
      this.keepStock,
      this.locationCode,
      this.refType,
      this.uid,
      this.updated,
      this.updatedUID,
      this.userID});

  factory RefTable.fromJson(Map<String, dynamic> json) {
    isEmptyString(Object? strobj) {
      return (strobj == null) ? "" : strobj.toString();
    }

    isEmptyDate(Object? strobj) {
      return (strobj == null)
          ? null
          : DateTime.parse(strobj.toString()).toLocal();
    }

    isEmptyBool(Object? strobj) {
      return (strobj == null) ? false : strobj as bool;
    }

    return RefTable(
        uid: json["uid"],
        code: isEmptyString(json["code"]),
        description: isEmptyString(json["description"]),
        refType: isEmptyString(json["refType"]),
        active: isEmptyBool(json["active"]),
        iClass: isEmptyString(json["iClass"]),
        keepStock: isEmptyBool(json["keepStock"]),
        companyCode: isEmptyString(json["companyCode"]),
        branchCode: isEmptyString(json["branchCode"]),
        locationCode: isEmptyString(json["locationCode"]),
        userID: isEmptyString(json["userID"]),
        created: isEmptyDate(json["created"]),
        updated: isEmptyDate(json["updated"]),
        updatedUID: json["updatedUID"]);
  }

  Map<String, dynamic> toJson(
          RefTable instance, String userid, String comp, String branch) =>
      <String, dynamic>{
        'Code': instance.code,
        'Description': instance.description,
        'RefType': instance.refType,
        'UserID': userID,
        'CompanyCode': comp,
        'BranchCode': branch,
        'LocationCode': ''
      };
}
