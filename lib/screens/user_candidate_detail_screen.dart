import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_system_flutter/screens/route.dart';

class UserCandidateDetailScreen extends StatelessWidget{
  static const String routName = "admin_candidate_detail_screen";
  final CandidateRoutArgsForDetail candidateRoutArgsForDetail;
  UserCandidateDetailScreen({@required this.candidateRoutArgsForDetail});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.candidateRoutArgsForDetail.candidate.name}'),

      ),
      body:
      Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "--------------------------------------------",
              style: TextStyle(color: Colors.redAccent),
            ),

            Text("Candidate Name:${this.candidateRoutArgsForDetail.candidate.name}"),

            Text(
              "--------------------------------------------",
              style: TextStyle(color: Colors.redAccent),
            ),
            Text('Party Name: ${this.candidateRoutArgsForDetail.candidate.party.name}'),
            Text(
              "--------------------------------------------",
              style: TextStyle(color: Colors.redAccent),
            ),
            SizedBox(
              height: 10,
            ),


          ],
        ),
      ),

    );
  }


}