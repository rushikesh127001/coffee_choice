import 'package:flutter/material.dart';
import 'package:learningfirebase/models/user.dart';
import 'package:learningfirebase/screens/authenticate/authenticate.dart';
import 'package:learningfirebase/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    print("xx");
   // print(user.uid);
    print("yy");
    if(user!=null) {
      print("xnx");
      print(user.uid);
      //Navigator.pushReplacementNamed(context, '/home');
      return HomeScreen();

    }
    print("not created");
    return Authenticate();
  }
}