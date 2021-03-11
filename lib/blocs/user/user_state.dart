import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/models/model.dart';

abstract class UserStates{}

class UserUnInitializedState extends UserStates{}

class UserFetchingState extends UserStates{}

class UserFetchedState extends UserStates{
  final List<User> users;
  UserFetchedState({@required this.users});
}

class UserFetchingErrorState extends UserStates{
  final String message;
  UserFetchingErrorState({@required this.message});
}

class UserPostingState extends UserStates{}

class UserPostedState extends UserStates{}

class UserPostingErrorState extends UserStates{
  final String message;
  UserPostingErrorState({@required this.message});
}

class UserUpdatingState extends UserStates{}

class UserUpdatedState extends UserStates{}

class UserUpdatingErrorState extends UserStates{
  final String message;
  UserUpdatingErrorState({@required this.message});
}

class UserDeletingState extends UserStates{}

class UserDeletedState extends UserStates{}

class UserDeletingErrorState extends UserStates{
  final String message;
  UserDeletingErrorState({@required this.message});
}

class UserUpdatigPasswordState extends UserStates{}

class UserUpdatedPasswordState extends UserStates{}

class UserUpdatingPasswordErrorState extends UserStates{
  final String message;
  UserUpdatingPasswordErrorState({@required this.message});
}
