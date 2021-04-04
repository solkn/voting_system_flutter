import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/result/result.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/screens/admin_home_screen.dart';
import 'package:voting_system_flutter/screens/route.dart';
import 'package:voting_system_flutter/screens/user_result_detail_screen.dart';
class ResultComponentUser extends StatelessWidget{
    final Result result;
    ResultComponentUser({@required this.result});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          UserResultDetailScreen.routName,
          arguments:          ResultRoutArgsForDetail(result: result),
        );
      },
      child: Container(
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 15,
          color: Colors.white,
          shadowColor: Colors.black54,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 35,
                                  child: Text(
                                    result.party.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text("Number Of Votes: ",
                                        style: TextStyle(
                                            color: Colors.blueAccent,fontStyle: FontStyle.italic
                                        ),),
                                      Text(result.ballot.toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: (){
                                BlocProvider.of<ResultBloc>(context)
                                    .add(UpdateResultEvent(result: result));
                                    // Navigator.of(context).pushNamedAndRemoveUntil(
                                    //     AdminHomeScreen.routName, (route) => false);

                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.where_to_vote,
                                    color: Colors.purpleAccent,
                                  ),
                                  Text(
                                    "Vote",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),


              ],
            ),
          ),
        ),
      ),
    );

  }
}