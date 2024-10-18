class customer {
  String? status;
  bool? isSuccess;
  List<Customerlist>? customerlist;

  customer({this.status, this.isSuccess, this.customerlist});

  customer.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isSuccess = json['is_success'];
    if (json['Customerlist'] != null) {
      customerlist = <Customerlist>[];
      json['Customerlist'].forEach((v) {
        customerlist!.add(new Customerlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['is_success'] = this.isSuccess;
    if (this.customerlist != null) {
      data['Customerlist'] = this.customerlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customerlist {
  String? customerId;
  String? companyId;
  String? customerCode;
  String? customerName;
  String? area;
  String? gstNo;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? panNo;
  String? contactPerson;
  String? designation;
  String? mobileNo;
  String? phoneNo;
  String? email;
  String? password;
  String? createdBy;
  String? recordStatus;
  String? updateBy;
  String? rTimestamp;

  Customerlist(
      {this.customerId,
        this.companyId,
        this.customerCode,
        this.customerName,
        this.area,
        this.gstNo,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.panNo,
        this.contactPerson,
        this.designation,
        this.mobileNo,
        this.phoneNo,
        this.email,
        this.password,
        this.createdBy,
        this.recordStatus,
        this.updateBy,
        this.rTimestamp});

  Customerlist.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    companyId = json['company_id'];
    customerCode = json['customer_code'];
    customerName = json['customer_name'];
    area = json['area'];
    gstNo = json['gst_no'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    panNo = json['pan_no'];
    contactPerson = json['contact_person'];
    designation = json['designation'];
    mobileNo = json['mobile_no'];
    phoneNo = json['phone_no'];
    email = json['email'];
    password = json['password'];
    createdBy = json['created_by'];
    recordStatus = json['record_status'];
    updateBy = json['update_by'];
    rTimestamp = json['r_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['company_id'] = this.companyId;
    data['customer_code'] = this.customerCode;
    data['customer_name'] = this.customerName;
    data['area'] = this.area;
    data['gst_no'] = this.gstNo;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['pan_no'] = this.panNo;
    data['contact_person'] = this.contactPerson;
    data['designation'] = this.designation;
    data['mobile_no'] = this.mobileNo;
    data['phone_no'] = this.phoneNo;
    data['email'] = this.email;
    data['password'] = this.password;
    data['created_by'] = this.createdBy;
    data['record_status'] = this.recordStatus;
    data['update_by'] = this.updateBy;
    data['r_timestamp'] = this.rTimestamp;
    return data;
  }
}
