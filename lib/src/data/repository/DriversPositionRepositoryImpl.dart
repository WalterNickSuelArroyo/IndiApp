
import 'package:indi_app/src/data/dataSource/remote/services/DriversPositionService.dart';
import 'package:indi_app/src/domain/models/DriverPosition.dart';
import 'package:indi_app/src/domain/repository/DriversPositionRepository.dart';
import 'package:indi_app/src/domain/utils/Resource.dart';

class DriversPositionRepositoryImpl implements DriverPositionRepository {

  DriversPositionService driversPositionService;

  DriversPositionRepositoryImpl(this.driversPositionService);

  @override
  Future<Resource<bool>> create(DriverPosition driverPosition) {
    return driversPositionService.create(driverPosition);
  }

  @override
  Future<Resource<bool>> delete(int idDriver) {
    return driversPositionService.delete(idDriver);
  }
  
  @override
  Future<Resource<DriverPosition>> getDriverPosition(int idDriver) {
    return driversPositionService.getDriverPosition(idDriver);
  }

}