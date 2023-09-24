class Accident {
  String? firstName;
  String? lastName;
  String? middleName;
  String? age;
  String? policyHolderName;
  String? nationalId;
  String? dob;
  String? insuranceAmount;
  String? occupancy;

  Accident(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.age,
      this.policyHolderName,
      this.nationalId,
      this.dob,
      this.insuranceAmount,
      this.occupancy});

  Accident.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    age = json['age'];
    policyHolderName = json['policy_holder_name'];
    nationalId = json['national_id'];
    dob = json['dob'];
    insuranceAmount = json['insurance_amount'];
    occupancy = json['occupancy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;
    data['age'] = this.age;
    data['policy_holder_name'] = this.policyHolderName;
    data['national_id'] = this.nationalId;
    data['dob'] = this.dob;
    data['insurance_amount'] = this.insuranceAmount;
    data['occupancy'] = this.occupancy;
    return data;
  }
}
