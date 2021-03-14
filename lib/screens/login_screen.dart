import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/auth/auth.dart';
import 'package:voting_system_flutter/consts.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/screens/admin_home_screen.dart';
import 'package:voting_system_flutter/screens/signup_screen.dart';
import 'package:voting_system_flutter/screens/user_home_screen.dart';
import 'package:voting_system_flutter/widgets/rounded_button.dart';

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
                  Navigator.of(context).pushReplacementNamed(AdminHomeScreen.routName);
                }
                else if(state.user.role.name .toUpperCase() == "USER"){
                  Navigator.of(context).pushReplacementNamed(UserHomeScreen.routName);
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

                       child: CircularProgressIndicator(
                         valueColor:AlwaysStoppedAnimation<Color>(Colors.blueAccent),
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
                         child: Text("Authentication Failed",style: TextStyle(color: Colors.red,fontWeight:
                         FontWeight.bold,fontStyle: FontStyle.italic),),
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
                      decoration: kTextFieldDecoration.copyWith(
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
                     decoration: kTextFieldDecoration.copyWith(
                       hintText: "enter your password",
                     ),

                   ),
                   SizedBox(
                     height: 10.0,
                   ),
                   RoundedButton(
                     title: 'Login',
                     colour: Colors.green,
                     onPressed: () {
                       final form = _formKey.currentState;
                       if (!form.validate()) {
                         return;
                       }
                       User user =
                       new User(email: email, password: password);
                       LoginEvent loginEvent = new LoginEvent(user: user);
                       BlocProvider.of<AuthBloc>(context).add(loginEvent);
                     },
                   ),
                   SizedBox(
                     height: 50.0,
                     child: Container(
                       //padding: EdgeInsets.symmetric(horizontal: 100.0),
                       margin: EdgeInsets.symmetric(horizontal: 60.0),
                       decoration: BoxDecoration(
                         color: Colors.yellow,
                       ),
                     ),
                   ),

                   RoundedButton(
                     title: 'SignUp',
                     colour: Colors.red,
                     onPressed: () {
                       Navigator.pushReplacementNamed(context,SignUpScreen.routName);
                     },
                   ),
                   SizedBox(
                     height: 10.0,
                   ),

                 ],
               );
            },
          ),
        ),
      ),
    );
  }

}