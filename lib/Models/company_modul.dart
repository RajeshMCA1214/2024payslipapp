class companylist {
  String? status;
  bool? isSuccess;
  List<CompanyList>? companyList;

  companylist({this.status, this.isSuccess, this.companyList});

  companylist.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isSuccess = json['is_success'];
    if (json['CompanyList'] != null) {
      companyList = <CompanyList>[];
      json['CompanyList'].forEach((v) {
        companyList!.add(new CompanyList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['is_success'] = this.isSuccess;
    if (this.companyList != null) {
      data['CompanyList'] = this.companyList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyList {
  String? companyId;
  String? companyCode;
  String? companyName;
  String? phone;
  String? address;
  String? area;
  String? city;
  String? pincode;
  String? state;
  String? zone;
  String? mailId;
  String? gstNo;
  String? panNo;
  String? createdDatetime;
  String? createdBy;
  String? updatedBy;
  String? companyLogo;
  String? isActive;
  String? recordStatus;

  CompanyList(
      {this.companyId,
        this.companyCode,
        this.companyName,
        this.phone,
        this.address,
        this.area,
        this.city,
        this.pincode,
        this.state,
        this.zone,
        this.mailId,
        this.gstNo,
        this.panNo,
        this.createdDatetime,
        this.createdBy,
        this.updatedBy,
        this.companyLogo,
        this.isActive,
        this.recordStatus});

  CompanyList.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    companyCode = json['company_code'];
    companyName = json['company_name'];
    phone = json['phone'];
    address = json['address'];
    area = json['area'];
    city = json['city'];
    pincode = json['pincode'];
    state = json['state'];
    zone = json['zone'];
    mailId = json['mail_id'];
    gstNo = json['gst_no'];
    panNo = json['pan_no'];
    createdDatetime = json['created_datetime'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    companyLogo = json['company_logo'];
    isActive = json['isActive'];
    recordStatus = json['record_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_id'] = this.companyId;
    data['company_code'] = this.companyCode;
    data['company_name'] = this.companyName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['area'] = this.area;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['zone'] = this.zone;
    data['mail_id'] = this.mailId;
    data['gst_no'] = this.gstNo;
    data['pan_no'] = this.panNo;
    data['created_datetime'] = this.createdDatetime;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['company_logo'] = this.companyLogo;
    data['isActive'] = this.isActive;
    data['record_status'] = this.recordStatus;
    return data;
  }
}
