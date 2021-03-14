
import 'package:voting_system_flutter/models/model.dart';

abstract class CandidateStates{}

class CandidateUnintializedState extends CandidateStates{}

class CandidateFetchingState extends CandidateStates{}

class CandidateFetchedState extends CandidateStates{
  final List<Candidate> candidate;

  CandidateFetchedState({this.candidate});
}
class CandidateFetchingErrorState extends CandidateStates{
  final String message;

  CandidateFetchingErrorState({this.message});

}
class CandidatePostingState extends CandidateStates{}

class CandidatePostedState extends CandidateStates{}

class CandidatePostingErrorState extends CandidateStates{
  final String message;
  CandidatePostingErrorState({this.message});
}

class CandidateUpdatingState extends CandidateStates{}

class CandidateUpdatedState extends CandidateStates{}

class CandidateUpdatingErrorState extends CandidateStates{
  final String message;

  CandidateUpdatingErrorState({this.message});
}

class CandidateDeletingState extends CandidateStates{}

class CandidateDeletedState extends CandidateStates{}

class CandidateDeletingErrorState extends CandidateStates{
  final String message;
  CandidateDeletingErrorState({this.message});

}

class CandidateFetchingEmptyState extends CandidateStates{}
