import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indi_app/src/domain/models/AuthResponse.dart';
import 'package:indi_app/src/domain/utils/Resource.dart';
import 'package:indi_app/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginState.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final response = state.response;
        if (response is ErrorData) {
          Fluttertoast.showToast(msg: '${response.message}', toastLength: Toast.LENGTH_LONG);
          print('Error Data: ${response.message}');
        } else if (response is Success) {
          print('Success Data: ${response.data}');
          final authResponse = response.data as AuthResponse;
          context.read<LoginBloc>().add(SaveUserSession(authResponse: authResponse));
          Navigator.pushNamedAndRemoveUntil(context, 'client/home', (route) => false);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final response = state.response;
          if (response is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return LoginContent(state);
        },
      ),
    ));
  }
}
