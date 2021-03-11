import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/models/model.dart';

class PartyRepository{
  final PartyDataProvider dataProvider;

  PartyRepository({@required this.dataProvider});

  Future<List<Party>>getParties()async{

    return await dataProvider.getParties();

  }
  Future<Party>getParty(String id)async{
    return await dataProvider.getParty(id);
  }
  Future<Party>postParty(Party party)async{
    return await dataProvider.postParty(party);

  }
  Future<Party>putParty(Party party)async{
    return await dataProvider.postParty(party);
  }
  Future<void>deleteParty(String id)async{
    return await dataProvider.deleteParty(id);
  }
}