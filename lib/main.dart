import 'package:flutter/material.dart';
import 'package:planit/provider/Provider.dart';
import 'package:planit/screens/Home/Home.dart';
import 'package:planit/utils/AppTheme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
      create: (_){
        return ListProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home:const HomeScreen()
    );
  }
}