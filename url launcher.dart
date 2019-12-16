import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Urllaunch());
}

class Urllaunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Launcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePageurl(title: 'URL Launcher'),
    );
  }
}

class MyHomePageurl extends StatefulWidget {
  MyHomePageurl({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageurlState createState() => _MyHomePageurlState();
}

class _MyHomePageurlState extends State<MyHomePageurl> {
  Future<Null> _launched;

  Future<Null> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<Null> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }


  Widget _launchStatus(BuildContext context, AsyncSnapshot<Null> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://flutter.io';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(toLaunch??null),
            ),
            RaisedButton(
              onPressed: () => setState(() {
                _launched = _launchInBrowser(toLaunch);
              }),
              child: const Text('Launch in browser'),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            RaisedButton(
              onPressed: () => setState(() {
                _launched = _launchInWebViewOrVC(toLaunch);
              }),
              child: const Text('Launch in app'),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),

            const Padding(padding: EdgeInsets.all(16.0)),
            FutureBuilder<Null>(future: _launched, builder: _launchStatus),
          ],
        ),
      ),
    );
  }
}