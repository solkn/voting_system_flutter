
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/auth/auth.dart';
import 'package:voting_system_flutter/blocs/user/user_bloc.dart';

class AppDrawerUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Vote'),
              automaticallyImplyLeading: false,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/sol.jpg"),
                          fit: BoxFit.fill
                      ),

                    ),
                  ),
                  Text("Solomon Kindie",
                    style: TextStyle(
                        color: Colors.purpleAccent,fontSize: 25,fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.where_to_vote),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
