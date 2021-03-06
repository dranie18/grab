class User {
  String id;
  String name;
  String picture;
  String email;
  String createdAt;
  ​
  User({this.id, this.name, this.picture, this.email, this.createdAt});
  ​
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    email = json['email'];
    createdAt = json['createdAt'];
  }
  ​
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    return data;
  }
}