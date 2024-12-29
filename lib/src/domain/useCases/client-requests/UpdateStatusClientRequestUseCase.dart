
import 'package:indi_app/src/domain/models/StatusTrip.dart';
import 'package:indi_app/src/domain/repository/ClientRequestsRepository.dart';

class UpdateStatusClientRequestUseCase {

  ClientRequestsRepository clientRequestsRepository;

  UpdateStatusClientRequestUseCase(this.clientRequestsRepository);

  run(int idClientRequest, StatusTrip statusTrip) => clientRequestsRepository.updateStatus(idClientRequest, statusTrip);

}