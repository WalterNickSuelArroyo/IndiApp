
import 'package:indi_app/src/domain/repository/GeolocatorRepository.dart';

class GetPositionStreamUseCase {

  GeolocatorRepository geolocatorRepository;

  GetPositionStreamUseCase(this.geolocatorRepository);

  run() => geolocatorRepository.getPositionStream();

}