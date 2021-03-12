import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/auth/auth.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/screens/admin_home_screen.dart';
import 'package:voting_system_flutter/screens/user_home_screen.dart';

class LoginScreen extends StatefulWidget{
  static const String routName ="login_screen";

  @override
  LoginScreenState createState() {

    return LoginScreenState();
  }

}
class LoginScreenState extends State<LoginScreen>{
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 0.0),
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthBloc,AuthStates>(
            listener: (context,state){
              if(state is LoginSuccessState){
                if(state.user.role.name.toUpperCase() == "ADMIN"){
                  Navigator.of(context).pushReplacementNamed(AdminHomeScreenState.routName);
                }
                else if(state.user.role.name .toUpperCase() == "USER"){
                  Navigator.of(context).pushReplacementNamed(UserHomeScreenState.routName);
                }
              }
            },
            builder:(context,state){
               return Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Flexible(
                     child: (state is LoggingState)
                         ? SizedBox(

                       child: LinearProgressIndicator(
                         valueColor:AlwaysStoppedAnimation<Color>(Colors.redAccent),
                       ),
                       height:10.0,
                       width: 50.0,

                     )
                         : Container(
                         height: 200.0,
                         child: Image.asset('images/logo.png')),
                   ),
                     (state is LoginFailedState)
                   ?Container(
                       child:Center(
                         child: Text("Authentication failed"),
                       )
                     )
                  :SizedBox(
                      height: 1,
              ),
                       (state is IncorrectUsernameOrPasswordState)
                   ?Container(
                       child: Center(
                         child: Text("Incorrect username or password",
                         style: TextStyle(
                           color: Colors.red,
                           fontWeight: FontWeight.bold,
                         ),),
                       ),
                     )
                     :SizedBox(
                       height: 1,
                     ),
                   TextFormField(
                     textAlign: TextAlign.center,
                     keyboardType: TextInputType.emailAddress,
                     onChanged: (value){
                      email = value;

                     },
                      decoration: InputDecoration(
                        hintText: "enter your email",
                      ),

                   ),
                   SizedBox(
                     height: 10.0,
                   ),
                   TextFormField(
                     obscureText: true,
                     textAlign: TextAlign.center,
                     onChanged: (value){
                       password = value;

                     },
                     decoration: InputDecoration(
                       hintText: "enter your password",
                     ),

                   ),
                   SizedBox(
                     height: 10.0,
                   ),
                   RaisedButton(
                     child: Text("login",style: TextStyle(fontSize: 16.0,color: Colors.blue),),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     onPressed: (){
                       final form = _formKey.currentState;
                       if(!form.validate()){
                         return;
                       }
                       User user = new User(email: email,password: password);
                       LoginEvent loginEvent = new LoginEvent(user: user);
                       BlocProvider.of<AuthBloc>(context).add(loginEvent);


              }

                   ),
                   SizedBox(
                     height: 10.0,
                   )
                 ],
               );
            },
          ),
        ),
      ),
    );
  }

}