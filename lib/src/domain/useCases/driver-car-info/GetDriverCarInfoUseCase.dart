
import 'package:indi_app/src/domain/repository/DriverCarInfoRepository.dart';

class GetDriverCarInfoUseCase {

  DriverCarInfoRepository driverCarInfoRepository;
  GetDriverCarInfoUseCase(this.driverCarInfoRepository);
  run(int idDriver) => driverCarInfoRepository.getDriverCarInfo(idDriver);
}