import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/party/party.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/repository/repository.dart';
class PartyBloc extends Bloc<PartyEvents,PartyStates>{
  final PartyRepository partyRepository;

  PartyBloc({@required this.partyRepository}):super(PartyUnintializedState());

  @override
  Stream<PartyStates> mapEventToState(PartyEvents event)async* {
    if(event is GetPartyEvent){
       yield* _mapGetPartyEventToState();
    }
    else if(event is PostPartyEvent){
      yield* _mapPartyPostEventToState(event.party);
    }
    else if(event is UpdatePartyEvent){
      yield* _mapUpdatePartyEventToState(event.party);
    }
    else if(event is DeletePartyEvent){
      yield* _mapDeletePartyEventToState(event.id);
    }
  }

  Stream<PartyStates>_mapGetPartyEventToState()async*{
     yield PartyFetchingState();
     try {
       List<Party>parties = await partyRepository.getParties();
       if (parties.length == 0) {
         yield PartyEmptyState();
       }
       else {
         yield PartyFetchedState(party: parties);
       }
     }on HttpException catch(e){
         yield PartyFetchingErrorState(message:e.message );


     }catch(e){
        yield PartyFetchingErrorState();
     }
  }
  Stream<PartyStates>_mapPartyPostEventToState(Party party)async*{
    yield PartyPostingState();
    try{
       await partyRepository.postParty(party);
       yield PartyPostedState();
    }on HttpException catch(e){
      yield PartyPostingErrorState(message: e.message);
    }
    catch(e){
      yield PartyPostingErrorState();
    }
  }
  Stream<PartyStates>_mapUpdatePartyEventToState(Party party)async*{
    yield PartyUpdatingState();
    try{
      await partyRepository.putParty(party);
      yield PartyPostedState();
    }on HttpException catch(e){
      yield PartyUpdatingErrorState(message: e.message);
    }
    catch(e){
      yield PartyUpdatingErrorState();
    }
  }
  Stream<PartyStates>_mapDeletePartyEventToState(String id)async*{
    yield PartyDeletingState();
    try{
      await partyRepository.deleteParty(id);
      yield PartyDeletedState();
    }on HttpException catch(e){
      yield PartyDeletingErrorState(message: e.message);
    }
    catch(e){
      yield PartyDeletingErrorState();
    }
  }

}

