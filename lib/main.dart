import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/Pages/splashscreen.dart';
import 'package:state_provider/provid_fun/provider_function.dart';

void main() {
  runApp(
     MultiProvider(providers: [
       ChangeNotifierProvider(create: (context)=>Provid()),

     ],
     child:  MyApp(),
     ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpalshScreen(),
    );
  }
}
