import 'dart:convert';

class Party{
  int id;
  String name;
  Party({this.id,this.name});

  factory Party.fromJson(Map<String,dynamic>json){
    return Party(
        id: json["id"],
        name: json["name"],
    );
  }

}