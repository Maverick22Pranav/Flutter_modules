import 'package:flutter/material.dart';
import 'package:flutter_app1/hometiles.dart';
import 'package:flutter_app1/main.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter_app1/webview.dart';

import 'datetime.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Visualization(),
    );
  }
}


class Visualization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        appBar: AppBar(
          title: Text('Charts'),
          centerTitle: true,
        actions: <Widget>[
          FlatButton(onPressed: (){
           Navigator.pop(context,MaterialPageRoute(builder: (context) => Tiles()),);
          },
            child: Text("Back"),
            textColor: Colors.white,
            shape:
            CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 250,
                child:
                charts.BarChart(
                  _createVisualizationData(),
                  animate: true,
                  behaviors: [
                    charts.ChartTitle('Company Size vs Number of Companies'),
                    charts.ChartTitle('Number of Companies',
                        behaviorPosition: charts.BehaviorPosition.start),
                    charts.ChartTitle('Company Size',
                        behaviorPosition: charts.BehaviorPosition.bottom)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: RaisedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BasicDateField()),);
                     },
                    child: Text("Next"),
                  )
              ),
            ],
          ),
        ),
      );
    }
  }

  static List<charts.Series<CompanySizeVsNumberOfCompanies, String>>
  _createVisualizationData() {
    final data = [
      CompanySizeVsNumberOfCompanies("1-15", 10),
      CompanySizeVsNumberOfCompanies("15-50", 20),
      CompanySizeVsNumberOfCompanies("51-200", 30),
      CompanySizeVsNumberOfCompanies("201-500", 10),
      CompanySizeVsNumberOfCompanies("501-1000", 40),
      CompanySizeVsNumberOfCompanies("1000+", 50),
    ];

    return [
      charts.Series<CompanySizeVsNumberOfCompanies, String>(
          id: 'CompanySizeVsNumberOfCompanies',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (CompanySizeVsNumberOfCompanies dataPoint, _) =>
          dataPoint.companySize,
          measureFn: (CompanySizeVsNumberOfCompanies dataPoint, _) =>
          dataPoint.numberOfCompanies,
          data: data)
    ];
  }
}

class CompanySizeVsNumberOfCompanies {
  final String companySize;
  final int numberOfCompanies;

  CompanySizeVsNumberOfCompanies(this.companySize, this.numberOfCompanies);
}