import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/models/model.dart';

class PartyRepository{
  final PartyDataProvider partyDataProvider;

  PartyRepository({@required this.partyDataProvider});

  Future<List<Party>>getParties()async{

    return await partyDataProvider.getParties();

  }
  Future<Party>getParty(String id)async{
    return await partyDataProvider.getParty(id);
  }
  Future<Party>postParty(Party party)async{
    return await partyDataProvider.postParty(party);

  }
  Future<Party>putParty(Party party)async{
    return await partyDataProvider.postParty(party);
  }
  Future<void>deleteParty(String id)async{
    return await partyDataProvider.deleteParty(id);
  }
}