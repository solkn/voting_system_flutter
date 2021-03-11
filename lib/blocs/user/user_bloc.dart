import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/user/user.dart';
import 'package:voting_system_flutter/models/http_exception.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/repository/repository.dart';

class UserBloc extends Bloc<UserEvents,UserStates>{
  final UserRepository userRepository;

  UserBloc({@required this.userRepository}) : super(UserUnInitializedState());

  @override
  Stream<UserStates> mapEventToState(UserEvents event)async* {
    if(event is GetUserEvent){
      yield* _mapGetUserEventToState();
    }
    else if(event is UpdateUserEvent){
      yield* _mapUpdateUserEventToState(event.user);
    }
    else if(event is UpdateUserEventPassword){
      yield* _mapUpdateUserPasswordEventToState(event.user, event.oldPassword);
    }
   }

  Stream<UserStates>_mapGetUserEventToState()async*{
    yield UserFetchingState();
    try{
          List<User>users;
          await userRepository.getUsers();
          yield UserFetchedState(users: users);
    }on HttpException catch(e){
      yield UserFetchingErrorState(message: e.message);
    }catch(e){
      yield UserFetchingErrorState();
    }
  }

  Stream<UserStates>_mapUpdateUserEventToState(User user)async*{
    yield UserUpdatingState();
    try{
      await userRepository.updateUser(user);

    }on HttpException catch(e){
      yield UserUpdatingErrorState(message: e.message);
    }catch(e){
      yield UserUpdatingErrorState();
    }
  }


  Stream<UserStates>_mapUpdateUserPasswordEventToState(User user,String oldPassword)async*{
    yield UserUpdatigPasswordState();
    try{
      await userRepository.updateUserPassword(user, oldPassword);
    }on HttpException catch(e){
      yield UserUpdatingPasswordErrorState(message: e.message);
    }catch(e){
      yield UserUpdatingPasswordErrorState();
    }
  }
}