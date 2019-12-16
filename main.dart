import 'package:flutter/material.dart';
import 'package:flutter_app1/login.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login with validation'),
        ),
        body: CustomForm(),
      ),
    );
  }
}
class CustomForm extends StatefulWidget
{
  @override
  CustomFormState createState(){
    return CustomFormState();
  }
}

class CustomFormState extends State<CustomForm>
{
  final _formkey= GlobalKey<FormState>();
  @override
  Widget build (BuildContext cntxt)
  {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SizedBox(
            width: 100,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 70, 0, 0) ,
            width: 300,
            child:TextFormField(

              validator: (value){
                if(value.isEmpty)
                {
                  return 'Enter username';
                }
                else{
                  return null;

                }
              },

              decoration: InputDecoration(
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  labelText: 'Username'
              ),

            ),
          ),
          SizedBox(
            height: 30,
          ),

          SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 7, 0, 0) ,
            width: 300,
            child: TextFormField(obscureText: true,

              validator: (value){
                if(value.isEmpty)
                {
                  return 'Enter the password';
                }
                else{
                  return null;

                }
              },

              decoration: InputDecoration(
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  labelText: 'Password'
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding:EdgeInsets.fromLTRB(50, 0, 0, 0) ,
            child:  RaisedButton(
              color: Colors.blue,
              splashColor: Colors.black12,
              onPressed: () {
                if(_formkey.currentState.validate())
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()),);
                }
              },
              child: Text('submit'),
            ),
          )

        ],
      ),
    );

  }
}
