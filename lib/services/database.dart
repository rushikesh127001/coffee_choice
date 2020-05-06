import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  //for linking brews to uer we need uid
  final String uid;
  DatabaseService({this.uid});
  //create an instance of the collection if not present create 1...(happens whne first ime called)
  final databaseInstance=Firestore.instance.collection('brew');

  Future updateUser(String coffee,String sugar,int strength)async{
    print("came here with ${coffee}");
    return await databaseInstance.document(uid).
  setData(
      {'name':coffee,
        'sugar':sugar,
        'strength':strength}
        );
  }

  Stream<QuerySnapshot> get brews{
    return databaseInstance.snapshots();
  }



}