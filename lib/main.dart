import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/bloc_observer.dart';
import 'package:voting_system_flutter/blocs/auth/auth.dart';
import 'package:voting_system_flutter/data_provider/data.dart';
import 'package:voting_system_flutter/repository/repository.dart';
import 'package:http/http.dart'as http;
import 'package:voting_system_flutter/screens/home.dart';
import 'package:voting_system_flutter/screens/login_screen.dart';
import 'package:voting_system_flutter/screens/route.dart';
import 'package:voting_system_flutter/util/util.dart';

void main(){

  Bloc.observer = SimpleBlocObserver();
   final UserRepository userRepository = UserRepository(dataProvider: UserDataProvider(httpClient: http.Client()));
   runApp(
     VotingApp(userRepository: userRepository),
   );
}
class VotingApp extends StatelessWidget{
  final UserRepository userRepository;
  VotingApp({@required this.userRepository});
  @override
  Widget build(BuildContext context) {
   return MultiRepositoryProvider(
       providers:[
           RepositoryProvider<UserRepository>(
               create:(_) =>userRepository)
       ], child: MultiBlocProvider(
     providers: [
           BlocProvider<AuthBloc>(
               create:(_) =>
           AuthBloc(userRepository: this.userRepository, util: Util()) ..add(AutoLoginEvent()),
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