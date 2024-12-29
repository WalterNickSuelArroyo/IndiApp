import 'package:indi_app/src/domain/models/DriverTripRequest.dart';
import 'package:indi_app/src/domain/utils/Resource.dart';

abstract class DriverTripRequestsRepository {

  Future<Resource<bool>> create(DriverTripRequest driverTripRequest);
  Future<Resource<List<DriverTripRequest>>> getDriverTripOffersByClientRequest(int idClientRequest);

}