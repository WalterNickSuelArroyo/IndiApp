
import 'package:indi_app/src/domain/models/DriverCarInfo.dart';
import 'package:indi_app/src/domain/repository/DriverCarInfoRepository.dart';

class CreateDriverCarInfoUseCase {

  DriverCarInfoRepository driverCarInfoRepository;
  CreateDriverCarInfoUseCase(this.driverCarInfoRepository);
  run(DriverCarInfo driverCarInfo) => driverCarInfoRepository.create(driverCarInfo);
}