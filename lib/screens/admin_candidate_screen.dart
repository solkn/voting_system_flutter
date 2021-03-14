import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/candidate/candidate.dart';
import 'package:voting_system_flutter/screens/splash_screen.dart';
import 'package:voting_system_flutter/widgets/candidate_component_admin.dart';

class AdminCandidateScreen extends StatelessWidget{
  final GlobalKey<ScaffoldState> scaffoldKey;
  AdminCandidateScreen({@required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
      return BlocConsumer(
        listener: (context,state){

        },

        builder: (context,state) {
          if (state is CandidateFetchingState) {
            return SplashScreen(title: "fetching candidates");
          }
          else if(state is CandidateFetchedState){
          final candidates = state.candidate;

          return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: candidates.length,
              itemBuilder: (_,idx)=>CandidateComponentAdmin(candidate: candidates[idx]));


          }else if(state is CandidateFetchingEmptyState){
            return SplashScreen(title: "no candidate added");

          }else{
            return SplashScreen(title: "failed to load candidate");
          }
        }
      );
  }

}