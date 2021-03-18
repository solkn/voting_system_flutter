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

    return BlocConsumer<ResultBloc,ResultStates>(
        listener: (context,state){

          if(state is ResultUpdatingState){
            scaffoldKey.currentState.showSnackBar(SnackBar(
                content:Text("Voting",style: TextStyle(color: Colors.purpleAccent,
                fontStyle: FontStyle.italic,fontSize: 20),),),
            );
            if(state is ResultUpdatedState){
               scaffoldKey.currentState.removeCurrentSnackBar();
                  BlocProvider.of<ResultBloc>(context,listen: false)
                      .add(GetResultEvent());
            }
            if(state is ResultFetchingErrorState){
              scaffoldKey.currentState.removeCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(SnackBar(
                    content:Text("Unable to Vote",style:
                    TextStyle(color: Colors.redAccent,
                    fontStyle: FontStyle.italic,fontSize: 20),),),
              );

            }

          }

        },

        builder: (context,state) {
          if (state is ResultFetchingState) {
            return SplashScreen(title: "fetching results");
          }
          else if(state is ResultFetchedState){
            final results = state.result;

            return ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: results.length,
                itemBuilder: (_,idx)=>ResultComponentUser(result: results[idx]));

          }else if(state is ResultEmptyState){
            return SplashScreen(title: "no result is added");
          }else if(state is ResultFetchingErrorState){
            return SplashScreen(title: "error to fetch result");
          }else{
            return SplashScreen(title: "failed to load result");
          }
        }
    );


}
}