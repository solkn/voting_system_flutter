import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/bloc_observer.dart';
import 'package:voting_system_flutter/blocs/auth/auth.dart';
import 'package:voting_system_flutter/blocs/candidate/candidate.dart';
import 'package:voting_system_flutter/blocs/result/result.dart';
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
  CandidateRepository candidateRepository =CandidateRepository(
      candidateDataProvider:CandidateDataProvider(httpClient: http.Client()));
  ResultRepository resultRepository =ResultRepository(
      resultDataProvider: ResultDataProvider(httpClient: http.Client()));


   runApp(VotingApp(
       userRepository: userRepository,
       resultRepository: resultRepository,
       candidateRepository: candidateRepository,
       roleRepository:roleRepository,


   ),
   );
}


class VotingApp extends StatelessWidget{
  final UserRepository userRepository;
  final ResultRepository resultRepository;
  final CandidateRepository candidateRepository;
  final RoleRepository roleRepository;
  VotingApp({
    @required this.userRepository,
    @required this.resultRepository,
    @required this.candidateRepository,
    @required this.roleRepository,
   }) :assert(
          userRepository != null &&
          resultRepository != null &&
          candidateRepository != null&&
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
           RepositoryProvider<CandidateRepository>(
               create:(_)=>candidateRepository ),
          RepositoryProvider<ResultRepository>(
              create: (_)=>resultRepository),
       ],

       child: MultiBlocProvider(
         providers: [
            BlocProvider<AuthBloc>(
              create:(_) =>
              AuthBloc(userRepository: this.userRepository, util: Util()) ..add(AutoLoginEvent()),
               ),
             BlocProvider<RoleBloc>(
               create: (_)=>
               RoleBloc(roleRepository: this.roleRepository)..add(GetRoleEvent()),
             ),
             BlocProvider<CandidateBloc>(
                 create: (_)=>
                 CandidateBloc(candidateRepository: this.candidateRepository)..add(GetCandidateEvent()),
    ),
             BlocProvider<UserBloc>(
                 create: (context)=>
                 UserBloc(userRepository: this.userRepository)..add(GetUserEvent()),

             ),
            BlocProvider<ResultBloc>(
                create: (_)=>
                 ResultBloc(resultRepository: resultRepository)..add(GetResultEvent()),
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