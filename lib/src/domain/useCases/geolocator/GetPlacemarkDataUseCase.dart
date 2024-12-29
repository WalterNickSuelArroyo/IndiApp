import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indi_app/src/domain/repository/GeolocatorRepository.dart';

class GetPlacemarkDataUseCase {

  GeolocatorRepository geolocatorRepository;

  GetPlacemarkDataUseCase(this.geolocatorRepository);

  run(CameraPosition cameraPosition) => geolocatorRepository.getPlacemarkData(cameraPosition);

}