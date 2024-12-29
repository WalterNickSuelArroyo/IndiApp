import 'package:indi_app/src/domain/repository/DriverTripRequestsRepository.dart';

class GetDriverTripOffersByClientRequestUseCase {

  DriverTripRequestsRepository driverTripRequestsRepository;

  GetDriverTripOffersByClientRequestUseCase(this.driverTripRequestsRepository);

  run(int idClientRequest) => driverTripRequestsRepository.getDriverTripOffersByClientRequest(idClientRequest);

}