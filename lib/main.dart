import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'HomePage.dart';


 main() async{

   ///initializing the hive
  await Hive.initFlutter();
   ///Open a Box
   var box = await Hive.openBox("myBox");
   box;

  runApp( const MyApp() );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage());}}