import 'dart:io';

import 'package:indi_app/src/domain/models/user.dart';
import 'package:indi_app/src/domain/repository/UsersRepository.dart';

class UpdateUserUseCase {

  UsersRepository usersRepository;

  UpdateUserUseCase(this.usersRepository);

  run(int id, User user, File? file) => usersRepository.update(id, user, file);

}