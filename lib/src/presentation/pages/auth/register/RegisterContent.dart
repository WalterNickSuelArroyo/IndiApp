import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indi_app/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indi_app/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indi_app/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indi_app/src/presentation/utils/BlocFormItem.dart';
import 'package:indi_app/src/presentation/widgets/DefaultButton.dart';
import 'package:indi_app/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  RegisterState state;
  RegisterContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
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
                  Color.fromARGB(255, 0, 123, 175), // #007BAF
                  Color.fromARGB(255, 0, 225, 255), // #00E1FF
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
                    Color.fromARGB(255, 1, 207, 255), // #01CFFF
                    Color.fromARGB(255, 0, 79, 115), // #004F73
                  ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
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
                        margin: EdgeInsets.only(left: 45, right: 45),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              NameChanged(name: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.name.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Apellido',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(LastnameChanged(
                              lastname: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.lastname.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              EmailChanged(email: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Telefono',
                        icon: Icons.phone_outlined,
                        margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              PhoneChanged(phone: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.phone.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Contraseña',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(PasswordChanged(
                              password: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.password.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Confirmar contraseña',
                        icon: Icons.phone_outlined,
                        margin: EdgeInsets.only(top: 15, left: 45, right: 45),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              ConfirmPasswordChanged(
                                  confirmPassword: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.confirmPassword.error;
                        },
                      ),
                      DefaultButton(
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmit());
                            context.read<RegisterBloc>().add(FormReset());
                          }
                        },
                        text: 'Registrarse',
                        margin: const EdgeInsets.only(
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
      ),
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
        style:
            TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
      ),
      const SizedBox(
        width: 4,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Incia sesión',
          style: TextStyle(
              color: Color.fromARGB(255, 246, 218, 45),
              fontWeight: FontWeight.bold,
              fontSize: 17),
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
    alignment: Alignment.center,
    child: Image.asset(
      'assets/img/car_location.png',
      width: 350,
      height: 350,
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
      Navigator.pop(context);
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
