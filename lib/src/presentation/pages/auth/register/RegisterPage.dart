import 'package:flutter/material.dart';
import 'package:indi_app/src/presentation/pages/auth/register/RegisterContent.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterContent(),
    );
  }
}