class Myfriend {
  String? fId;
  String? fName;
  String? fEmail;
  String? fAge;
  String? fImage;
  String? relationship;


  Myfriend({this.fId, this.fName, this.fEmail, this.fAge, this.fImage, required String relationship});

  Myfriend.fromJson(Map<String, dynamic> json) {
    fId = json['fId'];
    fName = json['fName'];
    fEmail = json['fEmail'];
    fAge = json['fAge'];
    fImage = json['fImage'];
    relationship = json['relationship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fId'] = this.fId;
    data['fName'] = this.fName;
    data['fEmail'] = this.fEmail;
    data['fAge'] = this.fAge;
    data['fImage'] = this.fImage;
    data['relationship'] = this.relationship;
    return data;
  }
}
