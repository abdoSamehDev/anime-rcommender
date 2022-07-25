class UsersModel{
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? pic;
  String? coverPic;
  String? bio;
  String? uId;

  UsersModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.pic,
    this.coverPic,
    this.bio,
    this.uId,
  });

  UsersModel.fromJson(Map<String, dynamic>json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    pic = json['pic'];
    coverPic = json['coverPic'];
    bio = json['bio'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap(){
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'pic': pic,
      'coverPic': coverPic,
      'bio': bio,
      'uId': uId,
    };
  }
}