import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/models/model.dart';

abstract class UserEvents extends Equatable{}

class GetUserEvent extends UserEvents{
  GetUserEvent();

  @override
  List<Object> get props => [];
}
class PostUserEvent extends UserEvents{
  final User user;
  PostUserEvent({@required this.user});

  @override
  List<Object> get props => [];
}
class UpdateUserEvent extends UserEvents{
  final User user;
  UpdateUserEvent({@required this.user});

  @override
  List<Object> get props => [];
}
class DeleteUserEvent extends UserEvents{
  final String id;
  DeleteUserEvent({@required this.id});

  @override
  List<Object>get props =>[];
}
class UpdateUserEventPassword extends UserEvents{
  final String oldPassword;
  final User user;
  UpdateUserEventPassword({@required this.user,this.oldPassword});

  @override
  List<Object> get props => [];

}