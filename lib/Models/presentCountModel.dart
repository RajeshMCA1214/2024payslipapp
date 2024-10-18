class presentCount {
  String? totalCount;
  String? status;
  List<Present>? present;

  presentCount({this.totalCount, this.status, this.present});

  presentCount.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    status = json['status'];
    if (json['present'] != null) {
      present = <Present>[];
      json['present'].forEach((v) {
        present!.add(new Present.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['status'] = this.status;
    if (this.present != null) {
      data['present'] = this.present!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Present {
  String? slno;
  String? attendanceMasterId;
  String? attendanceDetailsId;
  String? companyId;
  String? customerId;
  String? year;
  String? month;
  String? attendanceDate;
  String? clientId;
  String? empCode;
  String? empId;
  String? empName;
  String? aadhaarId;
  String? designation;
  String? shift;
  String? timeIn;
  String? timeOut;
  String? otHrs;
  String? isHoliday;
  String? workedHrs;
  String? late;
  String? earlyIn;
  String? earlyOut;
  String? recordStatus;
  String? attendanceTimestamp;
  String? totalCount;

  Present(
      {this.slno,
        this.attendanceMasterId,
        this.attendanceDetailsId,
        this.companyId,
        this.customerId,
        this.year,
        this.month,
        this.attendanceDate,
        this.clientId,
        this.empCode,
        this.empId,
        this.empName,
        this.aadhaarId,
        this.designation,
        this.shift,
        this.timeIn,
        this.timeOut,
        this.otHrs,
        this.isHoliday,
        this.workedHrs,
        this.late,
        this.earlyIn,
        this.earlyOut,
        this.recordStatus,
        this.attendanceTimestamp,
        this.totalCount});

  Present.fromJson(Map<String, dynamic> json) {
    slno = json['slno'];
    attendanceMasterId = json['attendance_master_id'];
    attendanceDetailsId = json['attendance_details_id'];
    companyId = json['company_id'];
    customerId = json['customer_id'];
    year = json['year'];
    month = json['month'];
    attendanceDate = json['attendance_date'];
    clientId = json['client_id'];
    empCode = json['emp_code'];
    empId = json['emp_id'];
    empName = json['emp_name'];
    aadhaarId = json['aadhaar_id'];
    designation = json['designation'];
    shift = json['shift'];
    timeIn = json['time_in'];
    timeOut = json['time_out'];
    otHrs = json['ot_hrs'];
    isHoliday = json['is_holiday'];
    workedHrs = json['worked_hrs'];
    late = json['late'];
    earlyIn = json['early_in'];
    earlyOut = json['early_out'];
    recordStatus = json['record_status'];
    attendanceTimestamp = json['attendance_timestamp'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slno'] = this.slno;
    data['attendance_master_id'] = this.attendanceMasterId;
    data['attendance_details_id'] = this.attendanceDetailsId;
    data['company_id'] = this.companyId;
    data['customer_id'] = this.customerId;
    data['year'] = this.year;
    data['month'] = this.month;
    data['attendance_date'] = this.attendanceDate;
    data['client_id'] = this.clientId;
    data['emp_code'] = this.empCode;
    data['emp_id'] = this.empId;
    data['emp_name'] = this.empName;
    data['aadhaar_id'] = this.aadhaarId;
    data['designation'] = this.designation;
    data['shift'] = this.shift;
    data['time_in'] = this.timeIn;
    data['time_out'] = this.timeOut;
    data['ot_hrs'] = this.otHrs;
    data['is_holiday'] = this.isHoliday;
    data['worked_hrs'] = this.workedHrs;
    data['late'] = this.late;
    data['early_in'] = this.earlyIn;
    data['early_out'] = this.earlyOut;
    data['record_status'] = this.recordStatus;
    data['attendance_timestamp'] = this.attendanceTimestamp;
    data['total_count'] = this.totalCount;
    return data;
  }
}
