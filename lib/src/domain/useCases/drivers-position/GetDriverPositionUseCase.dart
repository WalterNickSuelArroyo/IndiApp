import 'package:indi_app/src/domain/repository/DriversPositionRepository.dart';

class GetDriverPositionUseCase {

  DriverPositionRepository driverPositionRepository;

  GetDriverPositionUseCase(this.driverPositionRepository);

  run(int idDriver) => driverPositionRepository.getDriverPosition(idDriver);
 
}