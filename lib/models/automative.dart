class Automative {
  String? vahicleType;
  String? vahicleBrand;
  String? vahicleCategory;
  String? vahicleColor;
  String? vahicleRegNo;
  String? insuranceType;
  String? policyHolder;
  int? nationalId;
  String? chassisNo;
  int? noOfPrevAccident;
  int? noOfPassanger;
  String? engineType;
  String? engineCapacity;
  String? motoEngineNo;
  String? manufactureDate;
  int? totalTickets;
  int? insuranceAmount;

  Automative(
      {this.vahicleType,
      this.vahicleBrand,
      this.vahicleCategory,
      this.vahicleColor,
      this.vahicleRegNo,
      this.insuranceType,
      this.policyHolder,
      this.nationalId,
      this.chassisNo,
      this.noOfPrevAccident,
      this.noOfPassanger,
      this.engineType,
      this.engineCapacity,
      this.motoEngineNo,
      this.manufactureDate,
      this.totalTickets,
      this.insuranceAmount});

  Automative.fromJson(Map<String, dynamic> json) {
    vahicleType = json['vahicle_type'];
    vahicleBrand = json['vahicle_brand'];
    vahicleCategory = json['vahicle_category'];
    vahicleColor = json['vahicle_color'];
    vahicleRegNo = json['vahicle_reg_no'];
    insuranceType = json['insurance_type'];
    policyHolder = json['policy_holder'];
    nationalId = json['national_id'];
    chassisNo = json['chassis_no'];
    noOfPrevAccident = json['no_of_prev_accident'];
    noOfPassanger = json['no_of_passanger'];
    engineType = json['engine_type'];
    engineCapacity = json['engine_capacity'];
    motoEngineNo = json['moto_engine_no'];
    manufactureDate = json['manufacture_date'];
    totalTickets = json['total_tickets'];
    insuranceAmount = json['insurance_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vahicle_type'] = this.vahicleType;
    data['vahicle_brand'] = this.vahicleBrand;
    data['vahicle_category'] = this.vahicleCategory;
    data['vahicle_color'] = this.vahicleColor;
    data['vahicle_reg_no'] = this.vahicleRegNo;
    data['insurance_type'] = this.insuranceType;
    data['policy_holder'] = this.policyHolder;
    data['national_id'] = this.nationalId;
    data['chassis_no'] = this.chassisNo;
    data['no_of_prev_accident'] = this.noOfPrevAccident;
    data['no_of_passanger'] = this.noOfPassanger;
    data['engine_type'] = this.engineType;
    data['engine_capacity'] = this.engineCapacity;
    data['moto_engine_no'] = this.motoEngineNo;
    data['manufacture_date'] = this.manufactureDate;
    data['total_tickets'] = this.totalTickets;
    data['insurance_amount'] = this.insuranceAmount;
    return data;
  }
}
