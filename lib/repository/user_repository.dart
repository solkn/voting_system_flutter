import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/models/model.dart';

class UserRepository{
  final UserDataProvider dataProvider;
  UserRepository({@required this.dataProvider});

  Future<List<User>>getUsers()async{
    return await dataProvider.getUsers();

  }
  Future<User>updateUser(User user)async{
    return await dataProvider.updateUser(user);
  }
  Future<User>updateUserPassword(User user,String oldPassword)async{
    return await dataProvider.updateUserPassword(user, oldPassword);
  }
  Future<User>login(User user)async{
    return await dataProvider.login(user);
  }
  Future<User>signUp(User user)async{
    return await dataProvider.signUp(user);
  }
}