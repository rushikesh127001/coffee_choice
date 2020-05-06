import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learningfirebase/screens/home/brewlist.dart';
import 'package:learningfirebase/screens/home/updatebrew.dart';
import 'package:learningfirebase/services/auth.dart';
import 'package:learningfirebase/services/database.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
   // final brews=Provider.of<QuerySnapshot>(context);
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  await _authService.signOut();
                })
          ],
        ),
        body: Center(
          child: BrewList(),
        ),
        bottomSheet: UpdateBrew(),

      ),
    );
  }
}
/*
class ModalR extends ModalRoute {
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Form(child: Card(child:formmm(context),borderOnForeground: true,)),
          FloatingActionButton(onPressed: (){Navigator.pop(context);},child: Icon(Icons.cancel),)
        ],
      ))),
    );
  }

  @override
  // TODO: implement barrierColor
  Color get barrierColor => Colors.black.withOpacity(0.5);
  bool get barrierDismissible => true;
  @override
  // TODO: implement maintainState
  bool get maintainState => true;
  @override
  // TODO: implement barrierLabel
  String get barrierLabel => 'Change';
  @override
  // TODO: implement opaque
  bool get opaque => false;
  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(seconds: 1);
}

Widget formmm(context){
  final brews=Provider.of<QuerySnapshot>(context);
  return Form(

  child: Center(
    heightFactor: 2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,

      children: [
        Text("${brews.documents}"),
        FractionallySizedBox(
          widthFactor: 0.7,
          child: TextFormField(

            decoration: InputDecoration(hintText: "Enter Email"),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        FractionallySizedBox(
          widthFactor: .7,
          child: TextFormField(

            decoration: InputDecoration(hintText: "Enter Password"),
            obscureText: true,
          ),
        ),
        SizedBox(
          height: 30,
        ),

        RaisedButton(
          onPressed:(){print("gibberish");},
          child: Text("Update"),
          color: Colors.brown,
        )
      ],
    ),
  ),
);


}*/