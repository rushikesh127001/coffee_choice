

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learningfirebase/screens/wrapper.dart';
import 'package:learningfirebase/services/auth.dart';
import 'package:learningfirebase/services/navigation.dart';
import 'package:provider/provider.dart';
import 'package:learningfirebase/models/user.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        onGenerateRoute: NavigatorHelper.onGenerateRoute,
        home: Wrapper(),
      ),
    );
  }
}

