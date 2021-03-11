

import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/models/model.dart';

class RoleRepository {
  final RoleDataProvider dataProvider;

  RoleRepository({@required this.dataProvider});

  Future<List<Role>> getRoles() async {
    return await dataProvider.getRoles();
  }
  Future<Role>getRole(String id)async{
    return await dataProvider.getRole(id);
  }
  Future<Role>postRole(Role role)async{
    return await dataProvider.postRole(role);

  }
  Future<Role>putRole(Role role)async{
    return await dataProvider.putRole(role);
  }
  Future<void>deleteRole(String id)async{
    return await dataProvider.deleteRole(id);
  }
}