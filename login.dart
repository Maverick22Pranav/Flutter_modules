//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/hometiles.dart';
import 'package:flutter_app1/main.dart';

class Register extends StatefulWidget {

  @override
  RegisterState createState() {
    return new
    RegisterState();
  }
}
class Item {
   Item(this.name,this.icon);
   String name;
   Icon icon;
}

class RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  Item selectedUser;
  List<Item> users = <Item>[
    Item('Android', Icon(Icons.android, color: const Color(0xFF167F67),)),
    Item('Flutter', Icon(Icons.flag, color: const Color(0xFF167F67),)),
    Item('ReactNative',
        Icon(Icons.format_indent_decrease, color: const Color(0xFF167F67),)),
    Item('iOS',
        Icon(Icons.mobile_screen_share, color: const Color(0xFF167F67),)),
  ];
  final texts = TextEditingController();
  bool validate = false;

  @override
  void dispose() {
    texts.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        key: _formkey,

        debugShowCheckedModeBanner: false,

        title: "App",
        home: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => CustomForm()),);
              },
                textColor: Colors.white,
                child: Text('Back'),
                shape: CircleBorder(
                    side: BorderSide(color: Colors.transparent)),
              ),
            ],
            title: Text('Register page'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Mail textfeild
                Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(70, 50, 0, 0),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter username';
                            }
                            else {
                              return null;
                            }
                          },

                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "example@gmail.com",
                            labelText: "Mail Address",
                            errorText: validate ? "Email can't be empty" : null,
                          ),
                        ), width: 350.0,),
                    ]
                ),
                Row(
                  //Date of birth
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(70, 30, 0, 0),
                      child: TextFormField(
//                      validator: (value){
//                        if(value.isEmpty)
//                        {
//                          return 'Enter username';
//                        }
//                        else{
//                          return null;
//
//                        }
//                      },
                        decoration: InputDecoration(
                          labelText: 'Date of birth (DD-MM-YYYY)',
                          errorText: validate ? "DOB can't be empty" : null,
                        ),

                      ),width: 350.0,),
                  ],
                ),

                  Container(
                    // Drop down Menu
                    padding: EdgeInsets.fromLTRB(0, 20, 95, 0),
                       child: DropdownButton<Item>(


                          hint: Text("Department allocated"),
                          value: selectedUser,
                          onChanged: (Item Value) {
                          setState(() {
                          selectedUser = Value;
                          });
                          },
                          items: users.map((Item user) {
                          return  DropdownMenuItem<Item>(
                          value: user,
                          child: Row(
                              children: <Widget>[user.icon,
                              SizedBox(width: 10,),
                          Text(
                            user.name,
                            style:  TextStyle(color: Colors.black),
                            ),
                        ],
                      ),
                    );
                          }).toList(),
                          ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),

                  child: RaisedButton(onPressed: () {
                    //texts.text.isEmpty ? validate = true : validate = false;

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Tiles()));

                  },

                    child: Text('Submit'),
                  ),

                ),
                    ],
            ),
          ),
        )

    );
  }


}
