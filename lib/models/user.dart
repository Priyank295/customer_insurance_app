class User {
  final String full_name;
  final String email;
  final String mobile_no;
  final String password;
  final String occupation;
  final String gender;
  final String address;
  final String dob;
  final String housenoandbuildingname;
  final String street;
  final String country;
  final String city;
  final String state;
  final String district;
  final String national_id;
  final String road_name;
  final String house_no;

  User(
      {required this.full_name,
      required this.email,
      required this.address,
      required this.city,
      required this.country,
      required this.dob,
      required this.district,
      required this.gender,
      required this.house_no,
      required this.housenoandbuildingname,
      required this.mobile_no,
      required this.national_id,
      required this.occupation,
      required this.password,
      required this.road_name,
      required this.state,
      required this.street});

  Map<String, dynamic> toJson() {
    return {
      "full_name": full_name,
      "email": email,
      "mobile_no": mobile_no,
      "password": password,
      "occupation": occupation,
      "gender": gender,
      "address": address,
      "dob": dob,
      "housenoandbuildingname": housenoandbuildingname,
      "street": street,
      "country": country,
      "city": city,
      "state": state,
      "district": district,
      "national_id": national_id,
      "road_name": road_name,
      "house_no": house_no,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        full_name: json['full_name'],
        email: json['email'],
        occupation: json['occupation'],
        mobile_no: json['mobile_no'],
        gender: json['gender'],
        address: json['address'],
        dob: json['dob'],
        housenoandbuildingname: json['housenoandbuildingname'],
        street: json['street'],
        country: json['country'],
        city: json['city'],
        state: json['state'],
        district: json['district'],
        house_no: json['house_no'],
        national_id: json['national_id'],
        password: json['password'],
        road_name: json['road_name']);
  }
}
