import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_system_flutter/screens/route.dart';

class AdminResultDetailScreen extends StatelessWidget{
  static const String routName = "admin_result_detail_screen";
  final ResultRoutArgsForDetail resultRoutArdsForDetail;
  AdminResultDetailScreen({@required this.resultRoutArdsForDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.resultRoutArdsForDetail.result.party.name}'),

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


            Text('Party Name: ${this.resultRoutArdsForDetail.result.party.name}'),
            Text(
              "--------------------------------------------",
              style: TextStyle(color: Colors.redAccent),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Ballot: ${this.resultRoutArdsForDetail.result.ballot.toString()}'),
            Text(
              "--------------------------------------------",
              style: TextStyle(color: Colors.redAccent),
            ),
            SizedBox(
              height: 10,
            ),

            Text("GOOD LUCK"),
          ],
        ),
      ),

    );
  }

}