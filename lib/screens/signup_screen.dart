import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/auth/auth.dart';
import 'package:voting_system_flutter/consts.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/screens/login_screen.dart';
import 'package:voting_system_flutter/screens/user_home_screen.dart';
import 'package:voting_system_flutter/widgets/rounded_button.dart';

class SignUpScreen extends StatefulWidget{
  static const String routName = "signUp_screen";

  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }

}
class SignUpScreenState extends State<SignUpScreen>{
  final _formKey = GlobalKey<FormState>();
  String fullName;
  int  age;
  String email;
  String phone;
  String password;
  int roleID = 2;
  @override
  Widget build(BuildContext context) {

      return Scaffold(
         backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: BlocConsumer<AuthBloc,AuthStates>(
                  listener: (context,state){
                    if(state is SignUpSuccessState){
                      Navigator.pushReplacementNamed(context,UserHomeScreen.routName);
                    }

                  },
                  builder: (context,state){
                    return Column(
                    children: <Widget>[
                      (state is SignUpFailedState)
                       ?Container(
                         child: Center(
                           child: Text(
                             "SignUp Failed",
                             style: TextStyle(
                             color: Colors.red,
                              fontWeight: FontWeight.bold,
                               fontStyle: FontStyle.italic,
                             ),
                    )))
                        :SizedBox(
                            height: 1,
                    ),
                    (state is EmailAlreadyExistState)
                    ?Container(
                    child: Center(
                    child: Text(
                    "Email already Exists",
                    style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    ),
                    )))
                        :SizedBox(
                    height: 1,
                    ),
                    (state is PhoneAlreadyExistState)
                    ?Container(
                    child: Center(
                    child: Text(
                    "Phone Already Exists",
                    style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    ),
                    )))
                        :SizedBox(
                    height: 1,
                    ),

                    TextFormField(
                        textAlign: TextAlign.center,
                         keyboardType: TextInputType.name,
                        onChanged: (value){
                          fullName = value;
                    },
                       decoration: constTextFieldDecoration.copyWith(
                          hintText: "Enter your fullName",
                    ),
                    ),
                    SizedBox(
                    height: 8,
                    ),

                    TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                    age = int.parse(value);
                    },
                    decoration: constTextFieldDecoration.copyWith(
                    hintText: "Enter your age",
                    ),
                    ),
                    SizedBox(
                    height: 8,
                    ),
                    TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value){
                    email = value;
                    },
                    decoration: constTextFieldDecoration.copyWith(
                    hintText: "Enter your email",
                    ),
                    ),
                    SizedBox(
                    height: 8,
                    ),
                    TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    onChanged: (value){
                    phone = value;
                    },
                    decoration: constTextFieldDecoration.copyWith(
                    hintText: "Enter your phone",
                    ),
                    ),
                    SizedBox(
                    height: 8,
                    ),
                    TextFormField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value){
                    password = value;
                    },
                    decoration: constTextFieldDecoration.copyWith(
                    hintText: "Enter your password",
                    ),
                    ),
                    SizedBox(
                    height: 8,
                    ),
                      RoundedButton(
                        title: 'SignUp',
                        colour: Colors.green,
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (!form.validate()) {
                            return;
                          }
                          User user = new User.fullInfo(
                            fullName: fullName,
                            age: age,
                            email: email,
                            phone: phone,
                            password: password,
                            roleID: roleID,
                          );
                          SignUpEvent signUpEvent = new SignUpEvent(user: user);
                          BlocProvider.of<AuthBloc>(context)..add(signUpEvent);
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
                    title: 'already have an account?',
                    colour: Colors.red,
                    onPressed: () {
                    Navigator.pushReplacementNamed(context,LoginScreen.routName);
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
        ),
      );
  }

}