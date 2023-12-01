import 'package:flutter/material.dart';
import 'package:flutter_app_sale_29092023/presentation/sign_in/sign_in_page.dart';
import 'package:flutter_app_sale_29092023/presentation/sign_up/sign_up_page.dart';
import 'package:flutter_app_sale_29092023/presentation/splash/splash_page.dart';

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
      initialRoute: "/sign-in",
      routes: {
        "/splash": (context) => SplashPage(),
        "/sign-in": (context) => SignInPage(),
        "/sign-up": (context) => SignUpPage(),
        "/product": (context) => SignUpPage(),
      },
    );
  }
}
