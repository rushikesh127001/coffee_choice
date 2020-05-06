import 'package:firebase_auth/firebase_auth.dart';
import 'package:learningfirebase/models/user.dart';
import 'package:learningfirebase/services/database.dart';

User _getUserFromFirebaseUser(FirebaseUser user){
  if(user==null){
    return null;
  }

  return User(uid:user.uid);
}

class AuthService {

  final FirebaseAuth _auth= FirebaseAuth.instance;

  Stream<User> get user{

    return _auth.onAuthStateChanged.map(_getUserFromFirebaseUser);
  }

  Future signinAnon() async{
    try{
      AuthResult result= await _auth.signInAnonymously();
      FirebaseUser user= result.user;
      return _getUserFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmail(String email,String password) async{
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      await DatabaseService(uid: user.uid).updateUser('coffee', 'sugar', 200);


      return _getUserFromFirebaseUser(user);
    }
    catch(error){
      print(error.toString());
      return null;
    }
  }

  Future signinWithEmail(String email,String password) async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _getUserFromFirebaseUser(user);
    }
    catch(error){
      print(error.toString());
      return null;
    }
  }



  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;

    }
  }
}