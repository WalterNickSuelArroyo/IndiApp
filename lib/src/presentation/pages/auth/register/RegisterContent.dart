import 'package:flutter/material.dart';
import 'package:indi_app/src/presentation/widgets/DefaultButton.dart';
import 'package:indi_app/src/presentation/widgets/DefaultTextField.dart';
import 'package:indi_app/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromARGB(255, 12, 38, 145),
                Color.fromARGB(255, 34, 156, 249),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textLoginRotated(context),
              SizedBox(height: 65),
              _texRegisterRotated(context),
              SizedBox(height: 90)
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
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 224, 224, 224),
                ]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
          ),
          child: Stack(
            children: [
              _imageBackground(context),
              SingleChildScrollView(
                child: Column(
                  children: [
                    _imageBanner(),
                    DefaultTextFieldOutlined(
                      text: 'Nombre',
                      icon: Icons.person_outline,
                      margin: EdgeInsets.only(top: 25, left: 45, right: 45),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Apellido',
                      icon: Icons.person_2_outlined,
                      margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Email',
                      icon: Icons.email_outlined,
                      margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Telefono',
                      icon: Icons.phone_outlined,
                      margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Password',
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Confirmar Password',
                      icon: Icons.phone_outlined,
                      margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                    ),
                    DefaultButton(
                      text: 'Registrarse',
                      margin: EdgeInsets.only(
                          top: 40, bottom: 10, left: 60, right: 60),
                    ),
                    _separatorOr(),
                    _textIAlreadyHaveAccount(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _imageBackground(BuildContext context) {
  return Container(
    alignment: Alignment.bottomCenter,
    margin: EdgeInsets.only(bottom: 50),
    child: Image.asset(
      'assets/img/destination.png',
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.4,
      opacity: AlwaysStoppedAnimation(0.1),
    ),
  );
}

Widget _textIAlreadyHaveAccount(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '¿Ya tienes cuenta?',
        style: TextStyle(color: Colors.grey[700], fontSize: 17),
      ),
      const SizedBox(
        width: 4,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'login');
        },
        child: const Text(
          'Incia sesión',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      )
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

Widget _imageBanner() {
  return Container(
    margin: EdgeInsets.only(top: 60),
    alignment: Alignment.center,
    child: Image.asset(
      'assets/img/delivery.png',
      width: 150,
      height: 150,
    ),
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
        style: TextStyle(
            color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _textLoginRotated(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'login');
    },
    child: RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}
