import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrewList extends StatefulWidget{
  @override
  _BrewlistState createState()=>_BrewlistState();

}

class _BrewlistState extends State<BrewList>{

  @override
  Widget build(BuildContext context) {
    final brews=Provider.of<QuerySnapshot>(context);
    //print(brews.documents[0].data['name']);
    return ListView.builder(
      itemCount: brews.documents.length,
        itemBuilder: (context,brewnob){
          DocumentSnapshot snap=brews.documents[0];
          print(brews.documents.length,);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                title: Text("${brews.documents[brewnob].data['name']}",textScaleFactor: 1.5,),
                subtitle: Text("${brews.documents[brewnob].data['sugar']}",textScaleFactor: 1.4,),
               trailing: CircleAvatar(backgroundColor:Colors.brown[brews.documents[0].data['strength']],),
              ),
            ),
          );
        }
        );
  }
}