class PostsModel{
  String? firstName;
  String? lastName;
  String? postText;
  String? postDateTime;
  String? pic;
  String? postImage;
  String? uId;

  PostsModel({
    this.firstName,
    this.lastName,
    this.postText,
    this.postDateTime,
    this.pic,
    this.postImage,
    this.uId,
  });

  PostsModel.fromJson(Map<String, dynamic>json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    postText = json['postText'];
    postDateTime = json['postDateTime'];
    pic = json['pic'];
    postImage = json['postImage'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap(){
    return {
      'firstName': firstName,
      'lastName': lastName,
      'postText': postText,
      'postDateTime': postDateTime,
      'pic': pic,
      'postImage': postImage,
      'uId': uId,
    };
  }
}