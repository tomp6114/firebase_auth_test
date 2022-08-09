class UserModel {
  String? uid;
  String? email;
  String? fullName;
  String? mobileNumber;
  String? image;

  UserModel(
      {this.uid, this.email, this.fullName, this.mobileNumber, this.image});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "fullName": fullName,
        "mobileNumber": mobileNumber,
        "image": image
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        email: json['email'],
        fullName: json['fullName'],
        mobileNumber: json['mobileNumber'],
        image: json['image'],
      );
}
