class Marine {
  String? mobileNo;
  String? transportation;
  String? policyHolderName;
  String? nationalId;
  String? from;
  String? via;
  String? to;
  String? insuranceAmount;
  String? subjectMatterInsurance;

  Marine(
      {this.mobileNo,
      this.transportation,
      this.policyHolderName,
      this.nationalId,
      this.from,
      this.via,
      this.to,
      this.insuranceAmount,
      this.subjectMatterInsurance});

  Marine.fromJson(Map<String, dynamic> json) {
    mobileNo = json['mobile_no'];
    transportation = json['transportation'];
    policyHolderName = json['policy_holder_name'];
    nationalId = json['national_id'];
    from = json['from'];
    via = json['via'];
    to = json['to'];
    insuranceAmount = json['insurance_amount'];
    subjectMatterInsurance = json['subject_matter_insurance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_no'] = this.mobileNo;
    data['transportation'] = this.transportation;
    data['policy_holder_name'] = this.policyHolderName;
    data['national_id'] = this.nationalId;
    data['from'] = this.from;
    data['via'] = this.via;
    data['to'] = this.to;
    data['insurance_amount'] = this.insuranceAmount;
    data['subject_matter_insurance'] = this.subjectMatterInsurance;
    return data;
  }
}
