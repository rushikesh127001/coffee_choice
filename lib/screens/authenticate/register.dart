import 'package:flutter/material.dart';

import 'package:learningfirebase/services/auth.dart';



class Register extends StatefulWidget{

  _RegisterState createState()=>_RegisterState();
}

class _RegisterState extends State<Register>{
  final AuthService _authService= AuthService();
  //final TextEditingController _emailcontroller=new TextEditingController();
  //final TextEditingController _passcontroller=new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailfieldkey=GlobalKey<FormFieldState>();
  final _passwordfieldkey=GlobalKey<FormFieldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Sign Up"),
        actions: [
          FlatButton.icon(icon: Icon(Icons.near_me),label: Text("Sign In"),onPressed:()=> Navigator.of(context).pop(),),
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
                    key: _emailfieldkey,
                    decoration: InputDecoration(hintText: "Enter Email"),
                  ),
                ),

                FractionallySizedBox(
                  widthFactor: .7,
                  child: TextFormField(
                    key: _passwordfieldkey,
                    decoration: InputDecoration(hintText: "Enter Password"),
                    obscureText: true,
                  ),
                ),

                RaisedButton(
                  onPressed:()async{
                    print(_emailfieldkey.runtimeType);
                    if(_formKey.currentState.validate()){
                      dynamic result=await _authService.registerWithEmail(_emailfieldkey.currentState.value, _passwordfieldkey.currentState.value);
                      if(result!=null){
                        Navigator.of(context).pop();
                      }
                      else{
                        print("erorr user not registerd");
                      }
                    }
                    

                  },
                  child: Text("Register"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


