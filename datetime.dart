import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_app1/url launcher.dart';

// Another Method for simple date time picker
//Another Simple Meathod for date picker
//class TimeDate extends StatefulWidget {
//  @override
// TimeDateState createState()
//  {
//    return TimeDateState();
//  }
//}
//
////State is information of the application that can change over time or when some actions are taken.
//class TimeDateState extends State<TimeDate>{
//
//  String _value = '';
//
//  Future _selectDate() async {
//    DateTime picked = await showDatePicker(
//        context: context,
//        initialDate: new DateTime.now(),
//        firstDate: new DateTime(1990),
//        lastDate: new DateTime(2030)
//    );
//    if(picked != null) setState(() => _value = picked.toString());
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('DateTime Picker'),
//      ),
//      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
//      body: new Container(
//        padding: new EdgeInsets.all(32.0),
//        child: new Center(
//          child: new Column(
//            children: <Widget>[
//              new Text(_value),
//              new RaisedButton(onPressed: _selectDate, child: new Text('Date Picker'),)
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

// New date format

void main(){
  runApp(new MaterialApp(
    home: new BasicDateField(),
  ));
}
class BasicDateField extends StatelessWidget {
  final format1 = DateFormat("yyyy-MM-dd");
  final format2 = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time Picker"),
      ),
      body: SingleChildScrollView(

          child : Center(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 60, 20, 30),
                    child: Text('Date Picker'),
                  ),
                    // Date Format
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: DateTimeField(
                        format: format1,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 60, 20, 30),
                    child: Text('Time Picker'),
                  ),
                  // Time Format
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: DateTimeField(
                      format: format2,
                      onShowPicker: (context, currentValue) async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.convert(time);
                      },
                    ),
                  ),
                  RaisedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> MyHomePageurl()));
                  },
                    child: Text("Next"),
                  )

                ]
            ),
          ),

      ),
    );
  }
}

