class empCount {
  String? totalCount;
  String? status;
  List<Data>? data;

  empCount({this.totalCount, this.status, this.data});

  empCount.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? employeeId;
  String? companyId;
  String? salutation;
  String? employeeName;
  String? employeeCode;
  String? biometricId;
  String? empType;
  String? dOB;
  String? gender;
  String? maritalStatus;
  String? designation;
  String? salaryType;
  String? advance;
  String? mobileNo;
  String? email;
  String? presentAddress;
  String? presentCity;
  String? presentState;
  String? presentPincode;
  String? permanantAddress;
  String? permanantCity;
  String? permanantState;
  String? permanantPincode;
  String? joiningDate;
  String? fatherHusbandName;
  String? nationality;
  String? nomineeName;
  String? nomineeRelationship;
  String? previousCompany;
  String? noOfYearExp;
  String? trainingPeriod;
  String? skillMatrix;
  String? qualification;
  String? companyAccomodation;
  String? uanNo;
  String? epfNo;
  String? esicNo;
  String? image;
  String? aadharNumber;
  String? aadharCard;
  String? workingStatus;
  String? resignDate;
  String? createdBy;
  String? rTimestamp;
  String? remarks;
  String? recordStatus;
  String? totalCount;

  Data(
      {this.employeeId,
        this.companyId,
        this.salutation,
        this.employeeName,
        this.employeeCode,
        this.biometricId,
        this.empType,
        this.dOB,
        this.gender,
        this.maritalStatus,
        this.designation,
        this.salaryType,
        this.advance,
        this.mobileNo,
        this.email,
        this.presentAddress,
        this.presentCity,
        this.presentState,
        this.presentPincode,
        this.permanantAddress,
        this.permanantCity,
        this.permanantState,
        this.permanantPincode,
        this.joiningDate,
        this.fatherHusbandName,
        this.nationality,
        this.nomineeName,
        this.nomineeRelationship,
        this.previousCompany,
        this.noOfYearExp,
        this.trainingPeriod,
        this.skillMatrix,
        this.qualification,
        this.companyAccomodation,
        this.uanNo,
        this.epfNo,
        this.esicNo,
        this.image,
        this.aadharNumber,
        this.aadharCard,
        this.workingStatus,
        this.resignDate,
        this.createdBy,
        this.rTimestamp,
        this.remarks,
        this.recordStatus,
        this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    companyId = json['company_id'];
    salutation = json['salutation'];
    employeeName = json['employee_name'];
    employeeCode = json['employee_code'];
    biometricId = json['biometric_id'];
    empType = json['emp_type'];
    dOB = json['d_o_b'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    designation = json['designation'];
    salaryType = json['salary_type'];
    advance = json['advance'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    presentAddress = json['present_address'];
    presentCity = json['present_city'];
    presentState = json['present_state'];
    presentPincode = json['present_pincode'];
    permanantAddress = json['permanant_address'];
    permanantCity = json['permanant_city'];
    permanantState = json['permanant_state'];
    permanantPincode = json['permanant_pincode'];
    joiningDate = json['joining_date'];
    fatherHusbandName = json['father_husband_name'];
    nationality = json['nationality'];
    nomineeName = json['nominee_name'];
    nomineeRelationship = json['nominee_relationship'];
    previousCompany = json['previous_company'];
    noOfYearExp = json['no_of_year_exp'];
    trainingPeriod = json['training_period'];
    skillMatrix = json['skill_matrix'];
    qualification = json['qualification'];
    companyAccomodation = json['company_accomodation'];
    uanNo = json['uan_no'];
    epfNo = json['epf_no'];
    esicNo = json['esic_no'];
    image = json['image'];
    aadharNumber = json['aadhar_number'];
    aadharCard = json['aadhar_card'];
    workingStatus = json['working_status'];
    resignDate = json['resign_date'];
    createdBy = json['created_by'];
    rTimestamp = json['r_timestamp'];
    remarks = json['remarks'];
    recordStatus = json['record_status'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['company_id'] = this.companyId;
    data['salutation'] = this.salutation;
    data['employee_name'] = this.employeeName;
    data['employee_code'] = this.employeeCode;
    data['biometric_id'] = this.biometricId;
    data['emp_type'] = this.empType;
    data['d_o_b'] = this.dOB;
    data['gender'] = this.gender;
    data['marital_status'] = this.maritalStatus;
    data['designation'] = this.designation;
    data['salary_type'] = this.salaryType;
    data['advance'] = this.advance;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['present_address'] = this.presentAddress;
    data['present_city'] = this.presentCity;
    data['present_state'] = this.presentState;
    data['present_pincode'] = this.presentPincode;
    data['permanant_address'] = this.permanantAddress;
    data['permanant_city'] = this.permanantCity;
    data['permanant_state'] = this.permanantState;
    data['permanant_pincode'] = this.permanantPincode;
    data['joining_date'] = this.joiningDate;
    data['father_husband_name'] = this.fatherHusbandName;
    data['nationality'] = this.nationality;
    data['nominee_name'] = this.nomineeName;
    data['nominee_relationship'] = this.nomineeRelationship;
    data['previous_company'] = this.previousCompany;
    data['no_of_year_exp'] = this.noOfYearExp;
    data['training_period'] = this.trainingPeriod;
    data['skill_matrix'] = this.skillMatrix;
    data['qualification'] = this.qualification;
    data['company_accomodation'] = this.companyAccomodation;
    data['uan_no'] = this.uanNo;
    data['epf_no'] = this.epfNo;
    data['esic_no'] = this.esicNo;
    data['image'] = this.image;
    data['aadhar_number'] = this.aadharNumber;
    data['aadhar_card'] = this.aadharCard;
    data['working_status'] = this.workingStatus;
    data['resign_date'] = this.resignDate;
    data['created_by'] = this.createdBy;
    data['r_timestamp'] = this.rTimestamp;
    data['remarks'] = this.remarks;
    data['record_status'] = this.recordStatus;
    data['total_count'] = this.totalCount;
    return data;
  }
}
