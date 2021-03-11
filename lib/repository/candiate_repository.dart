
import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/models/model.dart';

class CandidateRepository {
  final CandidateDataProvider dataProvider;

  CandidateRepository({@required this.dataProvider});

  Future<List<Candidate>> getCandidates() async {
    return await dataProvider.getCandidates();
  }

  Future<Candidate>getCandidate(String id)async{
     return await dataProvider.getCandidate(id);
  }
  Future<Candidate>postCandidate(Candidate candidate)async{
     return await dataProvider.postCandidate(candidate);
  }
  Future<Candidate>putCandidate(Candidate candidate)async{

     return await dataProvider.putCandidate(candidate);
  }
  Future<void>deleteCandidate(String id)async{
    return await dataProvider.deleteCandidate(id);
  }
}