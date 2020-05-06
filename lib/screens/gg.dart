print("ddone");
//DocumentSnapshot usertoselect=brews.documents.firstWhere((element) => user.uid==(brews.documents[0].documentID),orElse: (){print("kuchnhi");return null;});
// DocumentSnapshot usertoselect1=brews.documents.firstWhere((element){ print(element.documentID);return user.uid==(brews.documents[0].documentID);},orElse: (){print("kuchnhi");return null;});
DocumentSnapshot usertoselect1=brews.documents.firstWhere((element){ if(user.uid==element.documentID)print(user.uid);return user.uid==element.documentID;},orElse: (){print("kuchnhi");return null;});
//DocumentSnapshot usertoselect1=brews.documents.firstWhere((element)=> user.uid==(brews.documents[0].documentID),orElse: (){print("kuchnhi");return null;});
dynamic namecontroller= new TextEditingController.fromValue(TextEditingValue(text: usertoselect1.data['name']));
dynamic sugarcontroller= new TextEditingController.fromValue(TextEditingValue(text: usertoselect1.data['sugar']));

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
initialValue: namecontroller.text,
decoration: InputDecoration(hintText: "Enter Email"),
),
),
SizedBox(
height: 30,
),
FractionallySizedBox(
widthFactor: .7,
child: TextFormField(
key: _sugartextfield,
initialValue: sugarcontroller.text,
decoration: InputDecoration(hintText: "Enter Password"),

),
),
SizedBox(
height: 30,
),

RaisedButton(
onPressed:(){
final DatabaseService _database= DatabaseService();
print(namecontroller.text);
print(_sugartextfield.runtimeType);
// _database.updateUser(_nametextfield.currentState.value, sugarcontroller.text, 400);
},
child: Text("Update"),
color: Colors.brown,
)
],
),
),
),
);