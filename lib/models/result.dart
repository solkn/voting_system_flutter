import 'package:voting_system_flutter/models/party.dart';

class Result{
  int id;
  int ballot;
  int partyID;
  Party party;

  Result({this.id,this.ballot,this.partyID,this.party});

  List<Object> get props =>[id,ballot,partyID,party];

  factory Result.fromJson(Map<String,dynamic>json){
    return Result(
        id: json["id"],
        ballot: json["ballot"],
        partyID: json["party_id"],
        party: Party.fromJson(json["party_name"]),
    );

  }

  String toString(){
    return 'Result{id:$id,ballot:$ballot,party_id:$partyID,bloc.party_name:$party}';
  }
}