import 'package:flutter/material.dart';
import 'package:learningfirebase/screens/authenticate/register.dart';
import 'package:learningfirebase/screens/authenticate/sign_in.dart';
import 'package:learningfirebase/screens/home/home.dart';
import 'package:learningfirebase/screens/wrapper.dart';
import 'package:learningfirebase/screens/home/updatebrew.dart';

class NavigatorHelper{

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    final args =settings.arguments;
    switch(settings.name) {
      case '/home': return MaterialPageRoute(builder: (_)=>Wrapper());
      case '/register': return MaterialPageRoute(builder: (_)=>Register());
      case '/signin': return MaterialPageRoute(builder: (_)=>Signin());

    }

    }
  }
