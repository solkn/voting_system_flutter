import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/models/model.dart';

abstract class ResultStates{}

class ResultUninitializedState extends ResultStates{}

class ResultFetchingState extends ResultStates{}

class ResultFetchedState extends ResultStates{
  List<Result>result;
  ResultFetchedState({@required this.result});

}

class ResultFetchingErrorState extends ResultStates{
  final String message;
  ResultFetchingErrorState({@required this.message});
}


class ResultPostingState extends ResultStates{}

class ResultPostedState extends ResultStates{}

class ResultPostingErrorState extends ResultStates{
  final String message;
  ResultPostingErrorState({@required this.message});
}

class ResultUpdatingState extends ResultStates{}

class ResultUpdatedState extends ResultStates{}

class ResultUpdatingErrorState extends ResultStates{
  final String message;
  ResultUpdatingErrorState({@required this.message});
}

class ResultDeletingState extends ResultStates{}

class ResultDeletedState extends ResultStates{}

class ResultDeletingErrorState extends ResultStates{
  final String message;
  ResultDeletingErrorState({@required this.message});
}
class ResultEmptyState extends ResultStates{}