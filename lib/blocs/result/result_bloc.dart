
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/result/result.dart';
import 'package:voting_system_flutter/models/http_exception.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/repository/repository.dart';

class ResultBloc extends Bloc<ResultEvents,ResultStates>{
  final ResultRepository resultRepository;
  ResultBloc({@required this.resultRepository}) : super(ResultUninitializedState());

  @override
  Stream<ResultStates> mapEventToState(ResultEvents event)async* {
   if(event is GetResultEvent){
     yield* _mapGetResultEventToState();
   }
   if(event is PostResultEvent){
     yield* _mapPostResultEventToState(event.result);
   }
   if(event is UpdateResultEvent){
     yield* _mapUpdateResultEventToState(event.result);
   }
   if(event is DeleteResultEvent){
     yield* _mapDeleteResultEventToState(event.id);
   }
  }

  Stream<ResultStates>_mapGetResultEventToState()async*{
    yield ResultFetchingState();
    try{

      List<Result>results;
      results = await resultRepository.getResults();
      if(results.length == 0){
        yield ResultEmptyState();
      }
      else{
        yield ResultFetchedState(result: results);
      }

    }on HttpException catch(e){
      yield ResultFetchingErrorState(message: e.message);
    }
    catch(e){
      yield ResultFetchingErrorState();
    }
  }
  Stream<ResultStates>_mapPostResultEventToState(Result result)async*{
    yield ResultPostingState();
    try{
      await resultRepository.postResult(result);
      yield ResultPostedState();

    }on HttpException catch(e){
      yield ResultPostingErrorState(message: e.message);
    }
    catch(e){
      yield ResultPostingErrorState();
    }
  }

  Stream<ResultStates>_mapUpdateResultEventToState(Result result)async*{
    yield ResultUpdatingState();
    try{
      await resultRepository.putResult(result);
      yield ResultUpdatedState();

    }on HttpException catch(e){
      yield ResultUpdatingErrorState(message: e.message);
    }
    catch(e){
      yield ResultUpdatingErrorState();
    }
  }

  Stream<ResultStates>_mapDeleteResultEventToState(String id)async*{
    yield ResultDeletingState();
    try{
    await resultRepository.deleteResult(id);
    yield ResultDeletedState();
    }on HttpException catch(e){
      yield ResultDeletingErrorState(message: e.message);
    }
    catch(e){
      yield ResultDeletingErrorState();
    }
  }


}