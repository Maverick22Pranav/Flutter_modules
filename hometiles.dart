import 'dart:async';
import 'dart:convert';
import 'package:flutter_app1/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app1/charts.dart';

class Post {
  final int userid;
  final int id;
  final String body;
  final String title;

  Post({this.userid, this.id, this.body, this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userid: json['userid'],
      id: json['id'],
      body: json['body'],
      title: json['title'],
    );
  }
}

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed TO Load Post');
  }
}

class Tiles extends StatefulWidget {
  Tiles({Key key}) : super(key: key);

  @override
  TilesState createState() => new TilesState();
}

class TilesState extends State<Tiles> {


  //avail
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    // avail
    // TODO: implement build
    return MaterialApp(
        //avail
        title: "App",
        home: Scaffold(
          //avail
          appBar: AppBar(
            centerTitle: true,
            title: Text("Api checks"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                textColor: Colors.white,
                child: Text("Back"),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
              )
            ],
          ),

          body:Column(
              //avail
              children: <Widget>[
                Container(
                  child: Center(
                      child: FutureBuilder<Post>(
                          future: post,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(snapshot.data.title);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          }
                          )
                  )

                ),
                      Row(children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(145,300,20,40),
                            child: RaisedButton(onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));

                  },
                             child: Text("Next page"),
                     ),

                  )
                ]
                )



              ],
            ),

          )
                    );


  }
}
