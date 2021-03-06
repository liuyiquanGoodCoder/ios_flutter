import 'global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class PersonalViewPage extends StatefulWidget {
  @override createState() => NotificationViewState();
}
class NotificationViewState extends State {
  var images = [];
  @override
  void initState() {
    super.initState();
    if (notificationSelection['images'] != null)
      for (var url in notificationSelection['images']) {
        http.get(url).then((response){
          images.add(response.bodyBytes);
          if (mounted)
            setState((){});
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    var data = notificationSelection;
    var title = data['title'];
    //var course = data['gender'];
    var content = data['content'];
    var createdBy = data['createdBy'];
    var datetime = DateTime.fromMillisecondsSinceEpoch(data['createdAt']);
    var createdAt = DateFormat('EEE, MMMM d, y H:m:s', 'en_US').format(datetime);
    var childWidgets = <Widget>[
      //Text(course, style: TextStyle(color: Colors.blue),),
      Divider(color: Colors.transparent,),
      Text(content),
    ];
    var width = MediaQuery.of(context).size.width - 120;
    for (var i in images) {
      childWidgets.add(Divider(color: Colors.transparent));
      childWidgets.add(Image.memory(i, width: width));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style:TextStyle(fontSize: 35.0,color:Colors.black,
      fontFamily: 'marker felt',),),backgroundColor: Colors.amberAccent,),

      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Column(
            children: childWidgets,
          ),
        ],
      ),
      persistentFooterButtons: <Widget>[
        Text('$createdAt by $createdBy'),
        IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () => delete(),
        ),
      ],
    );
  }
  void delete() {
    var key = notificationSelection['key'];
    //var course = notificationSelection['course'];
    //dbRef.child('Discussion/Discussion/notifications/$key').remove();
    dbRef.child('usersdiscussion/$userID/Discussion/notifications/$key').remove();



    for (var i = 0; i < images.length; i++)
      storageRef.child('$key/$i').delete();
    Navigator.pop(context);
  }
}