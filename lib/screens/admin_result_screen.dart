import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/candidate/candidate.dart';
import 'package:voting_system_flutter/blocs/result/result.dart';
import 'package:voting_system_flutter/screens/splash_screen.dart';
import 'package:voting_system_flutter/widgets/candidate_component_admin.dart';

class AdminResultScreen extends StatelessWidget{
  final GlobalKey<ScaffoldState> scaffoldKey;
  AdminResultScreen({@required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        listener: (context,state){

        },

        builder: (context,state) {
          if (state is ResultFetchedState) {
            return SplashScreen(title: "fetching results");
          }
          else if(state is ResultFetchedState){
            final candidates = state.result;

            return ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: candidates.length,
                itemBuilder: null);//(_,idx)=>ResultComponentAdmin(candidate: candidates[idx]));


          }else if(state is ResultFetchingErrorState){
            return SplashScreen(title: "no result added");

          }else{
            return SplashScreen(title: "failed to load result");
          }
        }
    );
  }

}