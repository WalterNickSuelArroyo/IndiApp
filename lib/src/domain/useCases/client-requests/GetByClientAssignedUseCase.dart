
import 'package:indi_app/src/domain/repository/ClientRequestsRepository.dart';

class GetByClientAssignedUseCase {

  ClientRequestsRepository clientRequestsRepository;

  GetByClientAssignedUseCase(this.clientRequestsRepository);

  run(int idClient) => clientRequestsRepository.getByClientAssigned(idClient);

}