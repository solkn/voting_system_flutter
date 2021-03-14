import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/models/model.dart';

class CandidateRepository {
  final CandidateDataProvider candidateDataProvider;

  CandidateRepository({@required this.candidateDataProvider});

  Future<List<Candidate>> getCandidates() async {
    return await candidateDataProvider.getCandidates();
  }

  Future<Candidate>getCandidate(String id)async{
     return await candidateDataProvider.getCandidate(id);
  }
  Future<Candidate>postCandidate(Candidate candidate)async{
     return await candidateDataProvider.postCandidate(candidate);
  }
  Future<Candidate>putCandidate(Candidate candidate)async{

     return await candidateDataProvider.putCandidate(candidate);
  }
  Future<void>deleteCandidate(String id)async{
    return await candidateDataProvider.deleteCandidate(id);
  }
}