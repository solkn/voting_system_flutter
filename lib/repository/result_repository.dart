import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/models/model.dart';

class ResultRepository{
  final ResultDataProvider dataProvider;

  ResultRepository({@required this.dataProvider});

  Future<List<Result>>getResults()async{
    return await dataProvider.getResults();
  }
  Future<Result>getResult(String id)async{
    return await dataProvider.getResult(id);
  }
  Future<Result>postResult(Result result)async{
    return await dataProvider.postResult(result);
  }
  Future<Result>putResult(Result result)async{
    return await dataProvider.putResult(result);
  }
  Future<void>deleteResult(String id)async{
    return await dataProvider.deleteResult(id);
  }
}