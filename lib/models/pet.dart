class Pet {
  String? petType;
  String? ownerName;
  String? petName;
  String? petAge;
  String? gender;
  String? color;
  String? priConditions;

  Pet(
      {this.petType,
      this.ownerName,
      this.petName,
      this.petAge,
      this.gender,
      this.color,
      this.priConditions});

  Pet.fromJson(Map<String, dynamic> json) {
    petType = json['pet_type'];
    ownerName = json['owner_name'];
    petName = json['pet_name'];
    petAge = json['pet_age'];
    gender = json['gender'];
    color = json['color'];
    priConditions = json['pri_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pet_type'] = this.petType;
    data['owner_name'] = this.ownerName;
    data['pet_name'] = this.petName;
    data['pet_age'] = this.petAge;
    data['gender'] = this.gender;
    data['color'] = this.color;
    data['pri_conditions'] = this.priConditions;
    return data;
  }
}
