import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indi_app/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indi_app/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:indi_app/src/domain/utils/Resource.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:indi_app/src/presentation/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  AuthUseCases authUseCases;

  final formKey = GlobalKey<FormState>();

  LoginUseCase loginUseCase = LoginUseCase();

  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Ingrese el email' : null),
          formKey: formKey));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Ingresa el password'
                  : event.password.value.length < 6
                      ? 'Minimo 6 caracteres'
                      : null),
          formKey: formKey));
    });

    on<FormSubmit>((event, emit) async {
      print('Email: ${state.email.value}');
      print('Password: ${state.password.value}');
      emit(
        state.copyWith(
          response: Loading(),
          formKey: formKey
        )
      );
      Resource response = await authUseCases.login.run(state.email.value, state.password.value);
      emit(
        state.copyWith(
          response: response,
          formKey: formKey
        )
      );
    });
  }
}
