import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learningfirebase/models/user.dart';
import 'package:learningfirebase/services/database.dart';


class UpdateBrew extends StatefulWidget{

  @override
  _UpdateBrewState createState()=>_UpdateBrewState();
  
}

class _UpdateBrewState extends State<UpdateBrew>{
  final GlobalKey<FormState> _coffeeformkey=GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _nametextfield=GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _sugartextfield=GlobalKey<FormFieldState>();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final brews=Provider.of<QuerySnapshot>(context);
    final user= Provider.of<User>(context);
    print("backhoid");

    print("tu hai");

    return RaisedButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
                //print("${brews.documents[0].data['sugar']}");
            print("ddone");
            //DocumentSnapshot usertoselect=brews.documents.firstWhere((element) => user.uid==(brews.documents[0].documentID),orElse: (){print("kuchnhi");return null;});
            // DocumentSnapshot usertoselect1=brews.documents.firstWhere((element){ print(element.documentID);return user.uid==(brews.documents[0].documentID);},orElse: (){print("kuchnhi");return null;});
            DocumentSnapshot usertoselect1=brews.documents.firstWhere((element){ if(user.uid==element.documentID)print(user.uid);return user.uid==element.documentID;},orElse: (){print("kuchnhi");return null;});
            //DocumentSnapshot usertoselect1=brews.documents.firstWhere((element)=> user.uid==(brews.documents[0].documentID),orElse: (){print("kuchnhi");return null;});
         //   dynamic namecontroller= new TextEditingController.fromValue(TextEditingValue(text: usertoselect1.data['name']));
          //  dynamic sugarcontroller= new TextEditingController.fromValue(TextEditingValue(text: usertoselect1.data['sugar']));
            dynamic namecontroller= new TextEditingController();
            dynamic sugarcontroller= new TextEditingController();

            // print(brews.documents.firstWhere((element) => user.uid==(brews.documents[0].documentID)).documentID);//importantntntntn

            // print(brews.documents.singleWhere((element) => user.uid==element.documentID));
            //if (snapshot.hasError)
            //return Text('Error: ${snapshot.error}');
            return Container(
              child: Form(
                key: _coffeeformkey,
                child: Center(
                  heightFactor: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      //Text("${brews.documents}"),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: TextFormField(
                          key: _nametextfield,
                         // initialValue: usertoselect1.data['name'],
                         // controller: namecontroller,
                          decoration: InputDecoration(hintText: "Enter Coffee Name"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FractionallySizedBox(
                        widthFactor: .7,
                        child: TextFormField(
                          key: _sugartextfield,
                         // controller: sugarcontroller,
                          //initialValue:await usertoselect1.data['sugar'],
                          decoration: InputDecoration(hintText: "Enter Sugar"),

                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      RaisedButton(
                        onPressed:(){
                          final DatabaseService _database= DatabaseService();
                        //  print("yyfdyyyyyyyyyyyyyy");
                          print(_sugartextfield.currentState.value);

                          //print(_sugartextfield.runtimeType);
                           _database.updateUser(_nametextfield.currentState.value, _sugartextfield.currentState.value, 400);
                           Navigator.pop(context);
                        },
                        child: Text("Update"),
                        color: Colors.brown,
                      )
                    ],
                  ),
                ),
              ),
            );
/*
            return FutureBuilder(
              future: Future.delayed(Duration(seconds: 1)),
              builder: (context,snapshot){

                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Press button to start.');
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Text('Please Wait...');
                  case ConnectionState.done:
                   
                // You can reach your snapshot.data['url'] in here
                }
                 // unreachable
                return null;
              },
              
            );*/
          },
        );
      },/*=> Navigator.of(context).pushNamed(
                'updatebrew',arguments:brews), *///Navigator.of(context).pushNamed('/updatebrew'),
      child: Text('Update Your Brew'),
    );
  }
}



