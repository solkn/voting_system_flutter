import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/result/result.dart';
import 'package:voting_system_flutter/screens/splash_screen.dart';
import 'package:voting_system_flutter/widgets/result_component_user.dart';

class UserResultScreen extends StatelessWidget{
   final GlobalKey<ScaffoldState>scaffoldKey;
   UserResultScreen({@required this.scaffoldKey});
  @override
  Widget build(BuildContext context) {

     return BlocBuilder<ResultBloc,ResultStates>(builder:(_,state){

       if(state is ResultFetchingState){
         return SplashScreen(title: "result fetching");
       }else if(state is ResultFetchedState){
         final results = state.result;
         ListView.builder(
           itemCount: results.length,
             itemBuilder: (_,idx)=>ResultComponentUser(result: results[idx]));
       } else if(state is ResultEmptyState){
         return SplashScreen(title: "no result is added");
       }else{
         return SplashScreen(title: "failed to load result");
       }

     }

     );
  }

}