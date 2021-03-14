import 'package:voting_system_flutter/models/party.dart';

class User{
  int id;
  String fullName;
  int  age;
  String email;
  String phone;
  String password;
  int roleID;
  Role role;

  User({this.email,this.password});
  User.fullInfo({
    this.id,
    this.fullName,
    this.age,
    this.email,
    this.phone,
    this.password,
    this.roleID,
    this.role,
});

  List<Object>get props =>[id,fullName,age,email,phone,password,roleID,role];

  factory User.fromJson(Map<String,dynamic>json){
    return User.fullInfo(
      id: json["id"],
      fullName: json["full_name"],
      age: json["age"],
      email: json["email"],
      phone:json["phone"] ,
      password: json["password"],
      roleID: json["role_id"],
      role: Role.fromJson(json["role_name"])
    );
  }

  String toString(){
    return 'User.fullInfo{id:$id,fullName:$fullName,age:$age,email:$email,phone:$phone'
        'password:$password,role_id:$roleID,role_name:$role}';
  }

}


class Role {
  int id;
  String name;

  Role({this.id, this.name});

  List<Object>get props=>[id,name];
  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json["id"],
      name: json["name"],
    );
  }
  @override
  String toString() {
    return 'Role{id:$id,name:$name}';
  }
}