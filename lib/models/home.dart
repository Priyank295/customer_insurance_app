class Home {
  String? fname;
  String? nationality;
  int? nationalId;
  String? coverage;
  String? category;
  int? sizeofvilla;
  String? location;
  int? nooffloors;
  int? noofrooms;
  String? homecategory;
  String? effectivedate;
  String? expirydate;
  int? limit;
  int? buildingNo;
  int? blockNo;
  int? plaateNo;
  int? plotNo;
  int? noResident;

  Home(
      {this.fname,
      this.nationality,
      this.nationalId,
      this.coverage,
      this.category,
      this.sizeofvilla,
      this.location,
      this.nooffloors,
      this.noofrooms,
      this.homecategory,
      this.effectivedate,
      this.expirydate,
      this.limit,
      this.buildingNo,
      this.blockNo,
      this.plaateNo,
      this.plotNo,
      this.noResident});

  Home.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    nationality = json['nationality'];
    nationalId = json['national_id'];
    coverage = json['coverage'];
    category = json['category'];
    sizeofvilla = json['sizeofvilla'];
    location = json['location'];
    nooffloors = json['nooffloors'];
    noofrooms = json['noofrooms'];
    homecategory = json['homecategory'];
    effectivedate = json['effectivedate'];
    expirydate = json['expirydate'];
    limit = json['limit'];
    buildingNo = json['BuildingNo'];
    blockNo = json['BlockNo'];
    plaateNo = json['PlaateNo'];
    plotNo = json['PlotNo'];
    noResident = json['NoResident'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = this.fname;
    data['nationality'] = this.nationality;
    data['national_id'] = this.nationalId;
    data['coverage'] = this.coverage;
    data['category'] = this.category;
    data['sizeofvilla'] = this.sizeofvilla;
    data['location'] = this.location;
    data['nooffloors'] = this.nooffloors;
    data['noofrooms'] = this.noofrooms;
    data['homecategory'] = this.homecategory;
    data['effectivedate'] = this.effectivedate;
    data['expirydate'] = this.expirydate;
    data['limit'] = this.limit;
    data['BuildingNo'] = this.buildingNo;
    data['BlockNo'] = this.blockNo;
    data['PlaateNo'] = this.plaateNo;
    data['PlotNo'] = this.plotNo;
    data['NoResident'] = this.noResident;
    return data;
  }
}
