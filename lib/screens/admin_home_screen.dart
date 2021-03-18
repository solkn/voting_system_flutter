
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_system_flutter/screens/admin_add_candidate_screen.dart';
import 'package:voting_system_flutter/screens/admin_candidate_screen.dart';
import 'package:voting_system_flutter/screens/admin_result_screen.dart';
import 'package:voting_system_flutter/widgets/app_drawer_admin.dart';
import 'package:voting_system_flutter/widgets/candidate_component_admin.dart';

import 'route.dart';

class AdminHomeScreen extends StatefulWidget {
  static const routName = 'admin_home_screen';

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Vote'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CandidateAddUpdate.routName,
                  arguments: CandidateRoutArgs(edit: false),
                );
              })
        ],
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: "Candidate",
            ),
            Tab(
              text: "Result",
            )
          ],
        ),
      ),
      drawer: AppDrawerAdmin(),
      body: TabBarView(controller: controller, children: <Widget>[
        AdminCandidateScreen(
          scaffoldKey: scaffoldKey,
        ),
        AdminResultScreen(
          scaffoldKey: scaffoldKey,
        )

      ]),
    );
  }
}
