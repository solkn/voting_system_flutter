import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/candidate/candidate.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/repository/repository.dart';
class CandidateBloc extends Bloc<CandidateEvents,CandidateStates>{
  final CandidateRepository candidateRepository;

  CandidateBloc({@required this.candidateRepository}):super(CandidateUnintializedState());

  @override
  Stream<CandidateStates> mapEventToState(CandidateEvents event)async* {
    if(event is GetCandidateEvent){
      yield* _mapGetCandidateEventToState();
    }
    else if(event is PostCandidateEvent){
      yield* _mapCandidatePostEventToState(event.candidate);
    }
    else if(event is UpdateCandidateEvent){
      yield* _mapUpdateCandidateEventToState(event.candidate);
    }
    else if(event is DeleteCandidateEvent){
      yield* _mapDeleteCandidateEventToState(event.id);
    }
  }

  Stream<CandidateStates>_mapGetCandidateEventToState()async*{
    yield CandidateFetchingState();
    try {
      List<Candidate>candidates = await candidateRepository.getCandidates();
      if (candidates.length == 0) {
        yield CandidateEmptyState();
      }
      else {
        yield CandidateFetchedState(candidate: candidates);
      }
    }on HttpException catch(e){
      yield CandidateFetchingErrorState(message:e.message );


    }catch(e){
      yield CandidateFetchingErrorState();
    }
  }
  Stream<CandidateStates>_mapCandidatePostEventToState(Candidate candidate)async*{
    yield CandidatePostingState();
    try{
      await candidateRepository.postCandidate(candidate);
      yield CandidateFetchedState();
    }on HttpException catch(e){
      yield CandidatePostingErrorState(message: e.message);
    }
    catch(e){
      yield CandidatePostingErrorState();
    }
  }
  Stream<CandidateStates>_mapUpdateCandidateEventToState(Candidate candidate)async*{
    yield CandidateFetchingState();
    try{
      await candidateRepository.putCandidate(candidate);
      yield CandidateFetchedState();
    }on HttpException catch(e){
      yield CandidateFetchingErrorState(message: e.message);
    }
    catch(e){
      yield CandidateFetchingErrorState();
    }
  }
  Stream<CandidateStates>_mapDeleteCandidateEventToState(String id)async*{
    yield CandidateDeletingState();
    try{
      await candidateRepository.deleteCandidate(id);
      yield CandidateDeletedState();
    }on HttpException catch(e){
      yield CandidateDeletingErrorState(message: e.message);
    }
    catch(e){
      yield CandidateDeletingErrorState();
    }
  }

}

