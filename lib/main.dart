import 'package:flutter/material.dart';
import 'home.dart';
import 'notification_list.dart';
import 'notification_view.dart';
import 'global.dart';
import 'notification_create.dart';
import 'notification_favorite.dart';
import 'discussion_list.dart';
import 'discussion_create.dart';




void main() {

  firebaseInit();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: <String, WidgetBuilder>{

        '/notificationCreate':
            (BuildContext context) => NotificationCreationPage(),
        '/discussionCreate':
            (BuildContext context) => DiscussionCreationPage(),

        '/notificationList':
            (BuildContext context) => NotificationListPage(),
        '/notificationView':
            (BuildContext context) => NotificationViewPage(),
        '/NotificationFavorite':
            (BuildContext context) => NotificationFavorite(),
        '/discussion':
            (BuildContext context) => discussionListPage(),
      },
    );
  }
}
