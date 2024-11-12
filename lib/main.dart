import 'package:assignment/Providers/authProvider.dart';
import 'package:assignment/Providers/dataProvider.dart';
import 'package:assignment/Screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(create: (context) => AuthProvider(),),
        Provider<DataProvider>(create: (context) => DataProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:Loginpage(),
      ),
    );
  }
}