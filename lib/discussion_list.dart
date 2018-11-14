
import 'package:flutter/material.dart';
import 'global.dart';
import 'package:intl/intl.dart';

class discussionListPage extends StatefulWidget {
  @override createState() => NotificationListState();
}
class NotificationListState extends State {

  var canCreate = true;
  var nMap = {};

  @override
  void initState() {
    super.initState();
    getRoles().then((_) => getNotificationList());
  }


  void getNotificationList() {
    Set roleSet, courseSet;
    if (roles != null) {
      roleSet = roles.values.toSet();
      courseSet = roles.keys.toSet();
    } else {
      roleSet = Set();
      courseSet = Set();
    }
    courseSet.add('Discussion');
    // canCreate = roleSet.contains('teacher') null
    //  || roleSet.contains('administrator');
    for (var c in courseSet) {
      var nRef = dbRef.child('Discussion/$c/notifications');
      nRef.onValue.listen((event) {
        if (event.snapshot.value == null) nMap.remove(c);
        else nMap[c] = (event.snapshot.value as Map).values.toList();
        if (mounted) setState(() {});
      });

      print(c);
    }
  }



  @override Widget build(BuildContext context) {

    var widgetList = <Widget>[];

    var data = List();
    for (List c in nMap.values)
      data.addAll(c);
    data.sort((a, b) => b['createdAt'] - a['createdAt']);
// for (var i = 1; i <= 20; i++) {
// var item = 'Notification $i';
    for (var i=0; i<data.length; i++){
      var item = data[i];
      var title = item['title'];
      var course = item['gender'];
      var datetime = DateTime.fromMillisecondsSinceEpoch(item['createdAt']);
      var createdAt = DateFormat('EEE, MMMM d, y H:m:s',
          'en_US').format(datetime);


      widgetList.add(
          ListTile(
              leading: Icon(Icons.notifications),

              title: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(createdAt,
                    style: TextStyle(fontSize: 10.0, color: Colors.blueGrey),),
                ],
              ),

              onTap: () {


                notificationSelection = item;
                Navigator.pushNamed(context, '/discussionView');
              }


          )
      );
    }
    return Scaffold(
      //floatingActionButton: (canCreate)? FloatingActionButton(child: Icon(Icons.add), onPressed: ()=>Navigator.pushNamed(context, '/discussionCreate'),
      //) : null,


      appBar: AppBar(title: Text('Discussion',style:TextStyle(fontSize: 35.0,color:Colors.black,
        fontFamily: 'marker felt',),),backgroundColor: Colors.amberAccent,),
      body: ListView(
        children: widgetList,
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}