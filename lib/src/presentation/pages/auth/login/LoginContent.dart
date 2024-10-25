import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:indi_app/src/presentation/utils/BlocFormItem.dart';
import 'package:indi_app/src/presentation/widgets/DefaultButton.dart';
import 'package:indi_app/src/presentation/widgets/DefaultTextField.dart';

class LoginContent extends StatelessWidget {
  final LoginState state;

  LoginContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 0, 123, 175), // #007BAF
                  Color.fromARGB(255, 0, 225, 255), // #00E1FF
                ],
              ),
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
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(left: 60, bottom: 60),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 1, 207, 255), // #01CFFF
                    Color.fromARGB(255, 0, 79, 115), // #004F73
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
            child: Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    _textNombre('Thunder'),
                    _imageCar(),
                    _textLogin(),
                    DefaultTextField(
                        onChanged: (text) {
                          context.read<LoginBloc>().add(
                              EmailChanged(email: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                        text: 'Email',
                        icon: Icons.email_outlined),
                    DefaultTextField(
                      onChanged: (text) {
                        context.read<LoginBloc>().add(PasswordChanged(
                            password: BlocFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.password.error;
                      },
                      text: 'Contraseña',
                      icon: Icons.lock_outlined,
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    DefaultButton(
                      text: 'Iniciar sesión',
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          context.read<LoginBloc>().add(FormSubmit());
                        } else {
                          print('El formulario no es valido');
                        }
                      },
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
          ),
        ],
      ),
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
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/online_taxi.png',
        width: 350,
        height: 350,
      ),
    );
  }

  Widget _textLogin() {
    return const Text(
      "Iniciar Sesión",
      style: TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _textNombre(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 53, color: Colors.white, fontWeight: FontWeight.bold),
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
