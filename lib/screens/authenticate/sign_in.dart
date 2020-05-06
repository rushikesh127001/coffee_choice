
import 'package:flutter/material.dart';

import 'package:learningfirebase/services/auth.dart';



class Signin extends StatefulWidget{
  
  _SigninState createState()=>_SigninState();
}

class _SigninState extends State<Signin>{
  final AuthService _authService= AuthService();
  final _formKey = GlobalKey<FormState>();
  final _emailfieldkey=GlobalKey<FormFieldState>();
  final _passwordfieldkey=GlobalKey<FormFieldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Sign in "),
        actions: [
          FlatButton.icon(icon: Icon(Icons.account_box),label: Text("Register"),onPressed:()=>Navigator.of(context).pushNamed( '/register'))
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
            child: Center(
              child: Column(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: TextFormField(
                      validator: (value)=>value.isEmpty?'Please Enter Email':null,
                      key: _emailfieldkey,
                      decoration: InputDecoration(hintText: "Enter Email"),
                    ),
                  ),

                  FractionallySizedBox(
                    widthFactor: .7,
                    child: TextFormField(
                      key: _passwordfieldkey,
                      decoration: InputDecoration(hintText: "Enter Password"),
                      validator: (value)=>value.isEmpty?'Please Enter Password':null,
                      obscureText: true,
                    ),
                  ),

                  RaisedButton(
                      onPressed:()async{
                        print("yyyyyyyyyyyyyyyy");
                        print(_emailfieldkey.runtimeType);
                        if(_formKey.currentState.validate()){
                          dynamic result= await _authService.signinWithEmail(_emailfieldkey.currentState.value, _passwordfieldkey.currentState.value);
                          //print(_passwordfieldkey.currentState.value);

                        }
                      },
                    child: Text("Submit"),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}


/*
 RaisedButton(
          onPressed: ()async{
            dynamic result=await _authService.signinAnon();
            if(result==null){
              print('failed signing in');
            }
            print('success signing in');
            print(result.uid);

          },
          child: Text("Sign in Anonymously"),
        ),








        maybee
        FormState form = _formKey.currentState;
form.save();
 */