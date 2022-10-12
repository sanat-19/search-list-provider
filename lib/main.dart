import 'package:flutter/material.dart';
import 'package:list_search/homepage.dart';
import 'package:list_search/provider_class.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (context) => CountryProvider(),
          child: const MyHomePage(title: 'Search List Using Provider')),
    );
  }
}
