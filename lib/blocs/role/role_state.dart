import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/models/model.dart';

abstract class RoleStates{}

class RoleUninitializedState extends RoleStates{}

class RoleFetchingState extends RoleStates{}

class RoleFetchedState extends RoleStates{
  final List<Role>role;
  RoleFetchedState({@required this.role});
}

class RoleFetchingErrorState extends RoleStates{
  final String message;
  RoleFetchingErrorState({@required this.message});
}

class RolePostingState extends RoleStates{}

class RolePostedtate extends RoleStates{}

class RolePostingErrorState extends RoleStates{
  final String message;
  RolePostingErrorState({@required this.message});
}

class RoleUpdatingState extends RoleStates{}

class RoleUpdatedState extends RoleStates{}

class RoleUpdatingErrorState extends RoleStates{
  final String message;
  RoleUpdatingErrorState({@required this.message});
}

class RoleDeletingState extends RoleStates{}

class RoleDeletedState extends RoleStates{}

class RoleDeletingErrorState extends RoleStates{
  final String message;
  RoleDeletingErrorState({@required this.message});
}

class RoleEmptyState extends RoleStates{}