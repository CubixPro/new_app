import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Form.dart';

class MyRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          title: Text('Search'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          RaisedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(context);
              }),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: Colors.indigo[100],
                child: Padding(
                    padding: const EdgeInsets.all(25), child: MyCustomForm())),
          )
        ])));
  }
}