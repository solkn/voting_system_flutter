
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/models/model.dart';

abstract class RoleEvents extends Equatable{}

class GetRoleEvent extends RoleEvents{
  GetRoleEvent();

  List<Object>get props=>[];
}
class PostRoleEvent extends RoleEvents{
  final Role role;
  PostRoleEvent({@required this.role});

  @override
  List<Object> get props => [];
}
class UpdateRoleEvent extends RoleEvents{
  final Role role;
  UpdateRoleEvent({@required this.role});
  @override
  List<Object> get props => [];

}
class DeleteRoleEvent extends RoleEvents{
  final String id;
  DeleteRoleEvent({@required this.id});

  @override
  List<Object> get props => [];
}