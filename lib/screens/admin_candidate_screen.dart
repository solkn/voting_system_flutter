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
      return BlocConsumer<CandidateBloc,CandidateStates>(
        listener: (context,state){
        if (state is CandidateDeletingState) {
          scaffoldKey.currentState.removeCurrentSnackBar();
          scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Deleting candidate.....'),
          ));
          SnackBar(
              content: Text('Deleting candidate.....'),
              duration: Duration(minutes: 2));
        }
        if (state is CandidateDeletedState) {
          scaffoldKey.currentState.removeCurrentSnackBar();
          BlocProvider.of<CandidateBloc>(context, listen: false)
              .add(GetCandidateEvent());
        }
        if (state is CandidateDeletingErrorState) {
          scaffoldKey.currentState.removeCurrentSnackBar();
          scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Fixture Deleted'),
              duration: Duration(
                seconds: 5,
              )));
        }
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

          //  return c;

          }else if(state is CandidateFetchingEmptyState){
            return SplashScreen(title: "no candidate added!");

          }else if(state is CandidateFetchingErrorState){
            return SplashScreen(title: "error occurred!");
          }else{
            return SplashScreen(title: "failed to load candidate!");
          }
        }


    );
  }

}