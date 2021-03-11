import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/role/role.dart';
import 'package:voting_system_flutter/models/http_exception.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/repository/repository.dart';

class RoleBloc extends Bloc<RoleEvents,RoleStates>{
  final RoleRepository roleRepository;
  RoleBloc({@required this.roleRepository}) : super(RoleUninitializedState());

  @override
  Stream<RoleStates> mapEventToState(RoleEvents event) async*{

    if(event is GetRoleEvent){
      yield* _mapGetRoleEventToState();
    }
    else if(event is PostRoleEvent){
      yield* _mapPostRoleEventToState(event.role);
    }
    else if(event is UpdateRoleEvent){
      yield* _mapUpdateRoleEventToState(event.role);
    }
    else if(event is DeleteRoleEvent){
      yield* _mapDeleteRoleEventToState(event.id);
    }
  }

  Stream<RoleStates>_mapGetRoleEventToState()async*{

    yield RoleFetchingState();
    try{
      List<Role>roles;
      if(roles.length == 0){
        yield RoleEmptyState();
      }
      else{
        await roleRepository.getRoles();
        yield RoleFetchedState(role: roles);
      }

    }on HttpException catch(e){
      yield RoleFetchingErrorState(message: e.message);
    }catch(e){
      yield RoleFetchingErrorState();
    }
  }

  Stream<RoleStates>_mapPostRoleEventToState(Role role)async*{
    yield RolePostingState();
    try{
      await roleRepository.postRole(role);
      yield RolePostedtate();
    }on HttpException catch(e){
      yield RolePostingErrorState(message: e.message);
    }catch(e){
      yield RolePostingErrorState();
    }

  }
  Stream<RoleStates>_mapUpdateRoleEventToState(Role role)async*{
    yield RoleUpdatingState();
    try{

      await roleRepository.putRole(role);
      yield RoleUpdatedState();
    }on HttpException catch(e){
      yield RoleUpdatingErrorState(message: e.message);
    }catch(e){
      yield RoleUpdatingErrorState();
    }
  }
  Stream<RoleStates>_mapDeleteRoleEventToState(String id)async*{
    yield RoleDeletingState();

    try{
      await roleRepository.deleteRole(id);
      yield RoleDeletedState();
    }on HttpException catch(e){
      yield RoleDeletingErrorState(message: e.message);
    }catch(e){
      yield RoleDeletingErrorState();
    }
  }


}