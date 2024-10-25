import 'package:indi_app/src/data/repository/AuthRepositoryImpl.dart';
import 'package:indi_app/src/domain/repository/AuthRepository.dart';

class LoginUseCase {
  
  AuthRepository repository;

  LoginUseCase(this.repository);

  run(String email, String password) => repository.login(email, password);
  
}