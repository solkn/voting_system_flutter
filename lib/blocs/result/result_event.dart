import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/models/result.dart';

abstract class ResultEvents extends Equatable{}

class GetResultEvent extends ResultEvents{
    GetResultEvent();

  @override
  List<Object> get props => [];
}
class PostResultEvent extends ResultEvents{
  final Result result;
  PostResultEvent({@required this.result});

  @override
  List<Object> get props => [];
}
class UpdateResultEvent extends ResultEvents{
  final Result result;
  UpdateResultEvent({@required this.result});

  @override
  List<Object> get props => [];

}
class DeleteResultEvent extends ResultEvents{
  final String id;
   DeleteResultEvent({@required this.id});
  @override
  List<Object> get props => [];

}