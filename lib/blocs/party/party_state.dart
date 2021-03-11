
import 'package:voting_system_flutter/models/model.dart';

abstract class PartyStates{}

class PartyUnintializedStae extends PartyStates{}

class PartyFetchingState extends PartyStates{}

class PartyFetchedState extends PartyStates{
  final List<Party> party;

  PartyFetchedState({this.party});
}
class PartyFetchingErrorState extends PartyStates{
  final String message;

  PartyFetchingErrorState({this.message});

}
class PartyPostingState extends PartyStates{}

class PartyPostedState extends PartyStates{}

class PartyPostingErrorState extends PartyStates{
  final String message;
  PartyPostingErrorState({this.message});
}

class PartyUpdatingState extends PartyStates{}

class PartyUpdatedState extends PartyStates{}

class PartyUpdatingErrorState extends PartyStates{
  final String message;

  PartyUpdatingErrorState({this.message});
}

class PartyDeletingState extends PartyStates{}

class PartyDeletedState extends PartyStates{}

class PartyDeletingErrorState extends PartyStates{
  final String message;
  PartyDeletingErrorState({this.message});

}

class PartyEmptyState extends PartyStates{}
