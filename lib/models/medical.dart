class Medical {
  String? individualType;
  String? age;
  List<Family>? row;
  String? policyHolder;
  String? nationalId;
  String? idNo;
  String? previouseMedicalCase;
  String? medicalDetails;

  Medical(
      {this.individualType,
      this.age,
      this.row,
      this.policyHolder,
      this.nationalId,
      this.idNo,
      this.previouseMedicalCase,
      this.medicalDetails});

  Medical.fromJson(Map<String, dynamic> json) {
    individualType = json['individual_type'];
    age = json['age'];
    if (json['row'] != null) {
      row = <Family>[];
      json['row'].forEach((v) {
        row!.add(new Family.fromJson(v));
      });
    }
    policyHolder = json['policy_holder'];
    nationalId = json['national_id'];
    idNo = json['id_no'];
    previouseMedicalCase = json['previouse_medical_case'];
    medicalDetails = json['medical_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['individual_type'] = this.individualType;
    data['age'] = this.age;
    if (this.row != null) {
      data['row'] = this.row!.map((v) => v.toJson()).toList();
    }
    data['policy_holder'] = this.policyHolder;
    data['national_id'] = this.nationalId;
    data['id_no'] = this.idNo;
    data['previouse_medical_case'] = this.previouseMedicalCase;
    data['medical_details'] = this.medicalDetails;
    return data;
  }
}

class Family {
  String? name;
  String? dob;

  Family({this.name, this.dob});

  Family.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dob'] = this.dob;
    return data;
  }
}
