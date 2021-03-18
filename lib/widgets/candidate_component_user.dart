import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/candidate/candidate.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/screens/admin_add_candidate_screen.dart';
import 'package:voting_system_flutter/screens/admin_candidate_detail_screen.dart';
import 'package:voting_system_flutter/screens/route.dart';
import 'package:voting_system_flutter/screens/user_candidate_detail_screen.dart';

class CandidateComponentUser extends StatelessWidget{
  final Candidate candidate;

  CandidateComponentUser({@required this.candidate});
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          UserCandidateDetailScreen.routName,
          arguments:          CandidateRoutArgsForDetail(candidate: candidate),
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
                                    candidate.party.name.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Text(candidate.name,
                                    style: TextStyle(
                                      color: Colors.purpleAccent,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,),
                                  ),
                                )
                              ],
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





