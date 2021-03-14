import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/models/model.dart';

class ResultRepository{
  final ResultDataProvider resultDataProvider;

  ResultRepository({@required this.resultDataProvider});

  Future<List<Result>>getResults()async{
    return await resultDataProvider.getResults();
  }
  Future<Result>getResult(String id)async{
    return await resultDataProvider.getResult(id);
  }
  Future<Result>postResult(Result result)async{
    return await resultDataProvider.postResult(result);
  }
  Future<Result>putResult(Result result)async{
    return await resultDataProvider.putResult(result);
  }
  Future<void>deleteResult(String id)async{
    return await resultDataProvider.deleteResult(id);
  }
}