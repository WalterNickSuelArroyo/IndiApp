import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:indi_app/src/presentation/widgets/DefaultButton.dart';
import 'package:indi_app/src/presentation/widgets/DefaultTextField.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 12, 38, 145),
                  Color.fromARGB(255, 34, 156, 249),
                ]),
          ),
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textLoginRotated(),
              SizedBox(height: 65),
              _texRegisterRotated(context),
              SizedBox(
                height: 90,
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 60, bottom: 60),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 14, 29, 166),
                    Color.fromARGB(255, 30, 112, 227),
                  ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
          child: Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                _textWelcome('Welcome'),
                _textWelcome('back...'),
                _imageCar(),
                _textLogin(),
                DefaultTextField(text: 'Email', icon: Icons.email_outlined),
                DefaultTextField(
                  text: 'Password',
                  icon: Icons.lock_outlined,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                ),
                Spacer(),
                DefaultButton(
                  text: 'Iniciar sesión',
                ),
                _separatorOr(),
                const SizedBox(
                  height: 10,
                ),
                _textDontHaveAccount(context),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: const EdgeInsets.only(right: 5),
        ),
        const Text(
          'O',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: const EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(color: Colors.grey[100], fontSize: 17),
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: const Text(
            'Registrate',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        )
      ],
    );
  }

  Widget _imageCar() {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset(
        'assets/img/car.png',
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _textLogin() {
    return Text(
      "Log in",
      style: TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _textWelcome(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _texRegisterRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'register');
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Registro',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _textLoginRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
      ),
    );
  }
}
