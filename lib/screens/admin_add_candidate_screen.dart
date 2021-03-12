import 'package:flutter/cupertino.dart';
import 'package:voting_system_flutter/screens/route.dart';

class CandidateAddUpdate extends StatefulWidget{
  static const String routName="admin_add_candidate";
  final CandidateRoutArgs candidateRoutArgs;
  CandidateAddUpdate({@required this.candidateRoutArgs});

  CandidateAddUpdateState createState(){
    return CandidateAddUpdateState();
  }
}
class CandidateAddUpdateState extends State<CandidateAddUpdate>{
  @override
  Widget build(BuildContext context) {

  }

}