class Shift {
  String? status;
  bool? isSuccess;
  List<ShiftList>? shiftList;

  Shift({this.status, this.isSuccess, this.shiftList});

  Shift.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isSuccess = json['is_success'];
    if (json['ShiftList'] != null) {
      shiftList = <ShiftList>[];
      json['ShiftList'].forEach((v) {
        shiftList!.add(new ShiftList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['is_success'] = this.isSuccess;
    if (this.shiftList != null) {
      data['ShiftList'] = this.shiftList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShiftList {
  String? slno;
  String? customerId;
  String? shiftType;
  String? fromTime;
  String? toTime;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? recordStatus;

  ShiftList(
      {this.slno,
        this.customerId,
        this.shiftType,
        this.fromTime,
        this.toTime,
        this.createdBy,
        this.createdAt,
        this.updatedBy,
        this.updatedAt,
        this.recordStatus});

  ShiftList.fromJson(Map<String, dynamic> json) {
    slno = json['slno'];
    customerId = json['customer_id'];
    shiftType = json['shift_type'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    recordStatus = json['record_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slno'] = this.slno;
    data['customer_id'] = this.customerId;
    data['shift_type'] = this.shiftType;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['record_status'] = this.recordStatus;
    return data;
  }
}
