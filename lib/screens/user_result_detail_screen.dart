import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_system_flutter/screens/route.dart';

class UserResultDetailScreen extends StatelessWidget{
  static const String routName = "user_result_detail_screen";
  final ResultRoutArgsForDetail resultRoutArgsForDetail;
  UserResultDetailScreen({@required this.resultRoutArgsForDetail});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.resultRoutArgsForDetail.result.id.toString()}'),

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

            Text("Party Name:${this.resultRoutArgsForDetail.result.party}"),

            Text(
              "--------------------------------------------",
              style: TextStyle(color: Colors.redAccent),
            ),
            Text('ballot : ${this.resultRoutArgsForDetail.result.ballot}'),
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