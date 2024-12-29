
import 'package:indi_app/src/domain/models/DriverPosition.dart';
import 'package:indi_app/src/domain/repository/DriversPositionRepository.dart';

class CreateDriverPositionUseCase {

  DriverPositionRepository driverPositionRepository;

  CreateDriverPositionUseCase(this.driverPositionRepository);

  run(DriverPosition driverPosition) => driverPositionRepository.create(driverPosition);

}