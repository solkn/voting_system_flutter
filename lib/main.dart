import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/bloc_observer.dart';
import 'package:voting_system_flutter/blocs/auth/auth.dart';
import 'package:voting_system_flutter/blocs/role/role.dart';
import 'package:voting_system_flutter/blocs/user/user.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/repository/repository.dart';
import 'package:http/http.dart'as http;
import 'package:voting_system_flutter/screens/home.dart';
import 'package:voting_system_flutter/screens/login_screen.dart';
import 'package:voting_system_flutter/screens/route.dart';
import 'package:voting_system_flutter/util/util.dart';

void main(){

  Bloc.observer = SimpleBlocObserver();


  UserRepository userRepository = UserRepository(
       userDataProvider: UserDataProvider(httpClient: http.Client()));
  RoleRepository roleRepository = RoleRepository(
       roleDataProvider: RoleDataProvider(httpClient:http.Client() ));


   runApp(VotingApp(
       userRepository: userRepository,
       roleRepository:roleRepository),
   );
}


class VotingApp extends StatelessWidget{
  final UserRepository userRepository;
  final RoleRepository roleRepository;
  VotingApp({
    @required this.userRepository,
    @required this.roleRepository,
  }) :assert(
       userRepository != null &&
       roleRepository != null
  );
  @override
  Widget build(BuildContext context) {
   return MultiRepositoryProvider(
       providers:[
           RepositoryProvider<UserRepository>(
               create:(_) =>userRepository),
           RepositoryProvider<RoleRepository>(
               create: (_)=>roleRepository),
       ],

       child: MultiBlocProvider(
         providers: [
            BlocProvider<AuthBloc>(
              create:(_) =>
              AuthBloc(userRepository: this.userRepository, util: Util()) ..add(AutoLoginEvent()),
               ),
             BlocProvider<RoleBloc>(
               create: (context)=>
               RoleBloc(roleRepository: this.roleRepository)..add(GetRoleEvent()),
             ),
             BlocProvider<UserBloc>(
                 create: (context)=>
                     UserBloc(userRepository: this.userRepository)..add(GetUserEvent()),

             ),
         ],
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
       title: "VotingApp",
       initialRoute: "/",
       onGenerateRoute: AppRoutes.generateRoute,

     ),
   ));
  }

}