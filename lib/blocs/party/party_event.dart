

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/models/model.dart';

abstract class PartyEvents extends Equatable{}

class GetPartyEvent extends PartyEvents{
  GetPartyEvent();
  List<Object> get props=>[];
}
class PostPartyEvent extends PartyEvents{
  final Party party;
  PostPartyEvent({@required this.party});

  @override
  List<Object> get props => [];


}
class UpdatePartyEvent extends PartyEvents{
  final Party party;
  UpdatePartyEvent({@required this.party});

  @override
  List<Object> get props => [];

}
class DeletePartyEvent extends PartyEvents{
  String id;
  DeletePartyEvent({@required this.id});

  @override
  List<Object> get props => [];
}