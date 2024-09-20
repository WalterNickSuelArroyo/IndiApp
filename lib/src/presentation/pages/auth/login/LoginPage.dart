import 'package:flutter/material.dart';
import 'package:indi_app/src/presentation/pages/auth/login/LoginContent.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: Color.fromARGB(255, 24, 181, 254),
        body: LoginContent());
  }
}
