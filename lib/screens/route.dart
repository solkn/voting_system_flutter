
//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/auth/auth.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/screens/admin_add_candidate_screen.dart';
import 'package:voting_system_flutter/screens/admin_add_party_screen.dart';
import 'package:voting_system_flutter/screens/admin_add_role_screen.dart';
import 'package:voting_system_flutter/screens/admin_candidate_detail_screen.dart';
import 'package:voting_system_flutter/screens/admin_candidate_screen.dart';
import 'package:voting_system_flutter/screens/admin_home_screen.dart';
import 'package:voting_system_flutter/screens/admin_result_detail_screen.dart';
import 'package:voting_system_flutter/screens/home.dart';
import 'package:voting_system_flutter/screens/login_screen.dart';
import 'package:voting_system_flutter/screens/signup_screen.dart';
import 'package:voting_system_flutter/screens/splash_screen.dart';
import 'package:voting_system_flutter/screens/user_candidate_detail_screen.dart';
import 'package:voting_system_flutter/screens/user_home_screen.dart';
import 'package:voting_system_flutter/screens/user_result_detail_screen.dart';

bool isAuthenticated = false;
bool isAdmin =false;

class AppRoutes{
  static Route generateRoute(RouteSettings settings){

    final routs = settings.name;

      switch (routs) {

        case "/":
          return MaterialPageRoute(
              builder: (context) =>
                  BlocBuilder<AuthBloc, AuthStates>(builder: (context, state) {
                    if (state is AutoLoginState) {
                      return SplashScreen(title: 'Authenticating');
                    } else if (state is AutoLoginSuccessState) {
                      isAdmin = state.user.role.name.toUpperCase() == 'ADMIN';
                      isAuthenticated = true;
                    } else if (state is AutoLoginFailedState) {
                      isAuthenticated = false;
                    } else if (state is LoggingOutState) {
                      return SplashScreen(title: 'Logging out');
                    } else if (state is LoggingOutSuccessState) {
                      isAuthenticated = false;
                    } else if (state is LoggingOutErrorState) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('An Error Occurred!'),
                          content: Text('Failed to log out'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Okay'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            )
                          ],
                        ),
                      );
                    }
                    return isAuthenticated
                        ? (isAdmin ? AdminHomeScreen() : UserHomeScreen())
                        : LoginScreen();
                  }));
        case HomeScreen.routName:
               return MaterialPageRoute(builder: (context)=>HomeScreen());
               break;
        case LoginScreen.routName:
              return MaterialPageRoute(builder: (context) => LoginScreen());
              break;
        case SignUpScreen.routName:
          return MaterialPageRoute(builder: (context)=>SignUpScreen());
          break;
        case AdminHomeScreen.routName:
          return MaterialPageRoute(builder: (context)=>AdminHomeScreen());
          break;
        case UserHomeScreen.routName:
          return MaterialPageRoute(builder: (context)=>UserHomeScreen());
          break;
        case CandidateAddUpdate.routName:
             final CandidateRoutArgs candidateRoutArgs = settings.arguments;
             return MaterialPageRoute(builder: (context)=>CandidateAddUpdate(
                 candidateArgs: candidateRoutArgs));
             break;
        case PartyAddUpdateScreen.routName:
          return MaterialPageRoute(builder: (context)=>PartyAddUpdateScreen());
          break;
        case RoleAddUpdateScreen.routName:
          return MaterialPageRoute(builder: (context)=>RoleAddUpdateScreen());
          break;
        case AdminCandidateDetailScreen.routName:
             final CandidateRoutArgsForDetail candidateRoutArgsForDetail = settings.arguments;
             return MaterialPageRoute(builder: (context)=>AdminCandidateDetailScreen(
                 candidateRoutArgsForDetail: candidateRoutArgsForDetail));
             break;
        case AdminCandidateDetailScreen.routName:
          final ResultRoutArgsForDetail resultRoutArgsForDetail = settings.arguments;
          return MaterialPageRoute(builder: (context)=>AdminResultDetailScreen(
              resultRoutArdsForDetail: resultRoutArgsForDetail));
          break;

        case UserCandidateDetailScreen.routName:
          final CandidateRoutArgsForDetail candidateRoutArgsForDetail = settings.arguments;
          return MaterialPageRoute(builder: (context)=>UserCandidateDetailScreen(
              candidateRoutArgsForDetail: candidateRoutArgsForDetail));
          break;

        case UserResultDetailScreen.routName:
          final ResultRoutArgsForDetail resultRoutArgsForDetail = settings.arguments;
          return MaterialPageRoute(builder: (context)=>UserResultDetailScreen(
              resultRoutArgsForDetail: resultRoutArgsForDetail));
          break;
      }

  }
}

class ResultRoutArgs{
   final Result result;
   final Party party;
   final bool edit;
   ResultRoutArgs({@required this.result,this.party,this.edit});

}
class CandidateRoutArgs{
  final Candidate candidate;
  final Party party;
  final bool edit;
  CandidateRoutArgs({@required this.candidate,this.party,this.edit});
}
class ResultRoutArgsForDetail{
  final Result result;
  ResultRoutArgsForDetail({@required this.result});
}
class CandidateRoutArgsForDetail{
  final Candidate candidate;
  CandidateRoutArgsForDetail({@required this.candidate});
}