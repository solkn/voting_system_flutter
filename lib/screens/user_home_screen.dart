
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_system_flutter/screens/admin_add_candidate_screen.dart';
import 'package:voting_system_flutter/screens/admin_candidate_screen.dart';
import 'package:voting_system_flutter/screens/admin_result_screen.dart';
import 'package:voting_system_flutter/screens/user_candidate_screen.dart';
import 'package:voting_system_flutter/screens/user_result_screen.dart';
import 'package:voting_system_flutter/widgets/app_drawer_admin.dart';
import 'package:voting_system_flutter/widgets/app_drawer_user.dart';
import 'package:voting_system_flutter/widgets/candidate_component_admin.dart';

import 'route.dart';

class UserHomeScreen extends StatefulWidget {
  static const routName = 'user_home_screen';

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen>
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
      drawer: AppDrawerUser(),
      body: TabBarView(controller: controller, children: <Widget>[
        UserCandidateScreen(
          scaffoldKey: scaffoldKey,
        ),
        UserResultScreen(
          scaffoldKey: scaffoldKey,
        )

      ]),
    );
  }
}
