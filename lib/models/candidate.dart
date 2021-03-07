import 'dart:convert';

import 'package:voting_system_flutter/models/party.dart';

class Candidate{

  int id;
  String name;
  int partyID;
  Party party;

  Candidate({this.id,this.name,this.partyID,this.party});

  factory Candidate.fromJson(Map<String,dynamic>json){
    return Candidate(
         id: json["id"],
         name: json["name"],
         partyID: json["partyID"],
         party: Party.fromJson(json["party"]),


    );
  }
}
