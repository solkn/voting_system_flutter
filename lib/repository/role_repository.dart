

import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/models/model.dart';

class RoleRepository {
  final RoleDataProvider roleDataProvider;

  RoleRepository({@required this.roleDataProvider});

  Future<List<Role>> getRoles() async {
    return await roleDataProvider.getRoles();
  }
  Future<Role>getRole(String id)async{
    return await roleDataProvider.getRole(id);
  }
  Future<Role>postRole(Role role)async{
    return await roleDataProvider.postRole(role);

  }
  Future<Role>putRole(Role role)async{
    return await roleDataProvider.putRole(role);
  }
  Future<void>deleteRole(String id)async{
    return await roleDataProvider.deleteRole(id);
  }
}