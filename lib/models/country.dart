class Country {
  String? name;
  String? flag;
  String? code;
  String? dialCode;

  Country({this.name, this.flag, this.code, this.dialCode});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
    code = json['code'];
    dialCode = json['dial_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['flag'] = this.flag;
    data['code'] = this.code;
    data['dial_code'] = this.dialCode;
    return data;
  }
}
