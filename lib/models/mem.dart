class Mem {
  String? mId;
  String? mFullname;
  String? mUsername;
  String? mPassword;
  String? mEmail;
  String? mAge;

  Mem(
      {this.mId,
      this.mFullname,
      this.mUsername,
      this.mPassword,
      this.mEmail,
      this.mAge});

  Mem.fromJson(Map<String, dynamic> json) {
    mId = json['mId'];
    mFullname = json['mFullname'];
    mUsername = json['mUsername'];
    mPassword = json['mPassword'];
    mEmail = json['mEmail'];
    mAge = json['mAge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mId'] = this.mId;
    data['mFullname'] = this.mFullname;
    data['mUsername'] = this.mUsername;
    data['mPassword'] = this.mPassword;
    data['mEmail'] = this.mEmail;
    data['mAge'] = this.mAge;
    return data;
  }
}
