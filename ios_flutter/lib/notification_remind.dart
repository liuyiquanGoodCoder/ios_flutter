import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'global.dart';

class NotificationRemind extends StatefulWidget {
  @override createState() => remindmeViewState();
}
class remindmeViewState extends State {


  var timeD = "";
  var brand = "";
  var discount = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remind me'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 5.0),
              child: new Row(
                children: <Widget>[
                  Text('Time:', style: TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),),
                ],
              )
          ), //container
          TextField(
            decoration: InputDecoration(
              hintText: 'Type the topic by yourself',
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (text) => setState(() => timeD = text),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 5.0),
            child: new Row(
              children: <Widget>[
                Text('Brand :', style: TextStyle(
                  fontSize: 30.0, fontWeight: FontWeight.bold,)),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Type the topic by yourself',
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (text) => setState(() => brand = text),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 5.0),
            child: new Row(
              children: <Widget>[
                Text('Discount :', style: TextStyle(
                  fontSize: 30.0, fontWeight: FontWeight.bold,)),
              ],
            ),
          ),
          TextField(decoration: InputDecoration(
            hintText: 'Type the places by yourself',
          ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (text) => setState(() => discount = text),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 5.0),
              child: FlatButton(color: Colors.lightBlue,
                onPressed: () =>
                    Navigator.pushNamed(context, '/reminderCreate'),
                child: Text('Comfirm'), textColor: Colors.white,)
          ),
        ],
      ),
    );
  }
}


