import 'package:developer_test/providers/list_users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/feed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListUsersProvider(),
        )
      ],
      child: MaterialApp(title: "Developer Test App", home: FeedScreen()),
    );
  }
}
