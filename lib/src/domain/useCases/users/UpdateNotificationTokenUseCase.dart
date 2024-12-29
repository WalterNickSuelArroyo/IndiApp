import 'package:indi_app/src/domain/repository/UsersRepository.dart';

class UpdateNotificationTokenUseCase {

  UsersRepository usersRepository;

  UpdateNotificationTokenUseCase(this.usersRepository);

  run(int id, String notificationToken) => usersRepository.updateNotificationToken(id, notificationToken);

}