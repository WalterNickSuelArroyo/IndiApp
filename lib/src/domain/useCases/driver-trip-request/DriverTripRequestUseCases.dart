
import 'package:indi_app/src/domain/useCases/driver-trip-request/CreateDriverTripRequestUseCase.dart';
import 'package:indi_app/src/domain/useCases/driver-trip-request/GetDriverTripOffersByClientRequestUseCase.dart';

class DriverTripRequestUseCases {

  CreateDriverTripRequestUseCase createDriverTripRequest;
  GetDriverTripOffersByClientRequestUseCase getDriverTripOffersByClientRequest;

  DriverTripRequestUseCases({
    required this.createDriverTripRequest,
    required this.getDriverTripOffersByClientRequest,
  });

}