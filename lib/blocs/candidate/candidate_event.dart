import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/models/model.dart';

abstract class CandidateEvents extends Equatable{}

class GetCandidateEvent extends CandidateEvents{
  GetCandidateEvent();
  List<Object> get props=>[];
}
class PostCandidateEvent extends CandidateEvents{
  final Candidate candidate;
  PostCandidateEvent({@required this.candidate});

  @override
  List<Object> get props => [];


}
class UpdateCandidateEvent extends CandidateEvents{
  final Candidate candidate;
  UpdateCandidateEvent({@required this.candidate});

  @override
  List<Object> get props => [];

}
class DeleteCandidateEvent extends CandidateEvents{
  final String id;
  DeleteCandidateEvent({@required this.id});

  @override
  List<Object> get props => [];
}