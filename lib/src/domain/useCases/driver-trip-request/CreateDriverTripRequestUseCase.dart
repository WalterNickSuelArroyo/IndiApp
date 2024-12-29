
import 'package:indi_app/src/domain/models/DriverTripRequest.dart';
import 'package:indi_app/src/domain/repository/DriverTripRequestsRepository.dart';

class CreateDriverTripRequestUseCase {

  DriverTripRequestsRepository driverTripRequestsRepository;

  CreateDriverTripRequestUseCase(this.driverTripRequestsRepository);

  run(DriverTripRequest driverTripRequest) => driverTripRequestsRepository.create(driverTripRequest);
}