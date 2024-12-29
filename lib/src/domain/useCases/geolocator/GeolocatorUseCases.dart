import 'package:indi_app/src/domain/useCases/geolocator/CreateMarkerUseCase.dart';
import 'package:indi_app/src/domain/useCases/geolocator/FindPositionUseCase.dart';
import 'package:indi_app/src/domain/useCases/geolocator/GetMarkerUseCase.dart';
import 'package:indi_app/src/domain/useCases/geolocator/GetPlacemarkDataUseCase.dart';
import 'package:indi_app/src/domain/useCases/geolocator/GetPolylineUseCase.dart';
import 'package:indi_app/src/domain/useCases/geolocator/GetPositionStreamUseCase.dart';

class GeolocatorUseCases {

  FindPositionUseCase findPosition;
  CreateMarkerUseCase createMarker;
  GetMarkerUseCase getMarker;
  GetPlacemarkDataUseCase getPlacemarkData;
  GetPolylineUseCase getPolyline;
  GetPositionStreamUseCase getPositionStream;

  GeolocatorUseCases({
    required this.findPosition,
    required this.createMarker,
    required this.getMarker,
    required this.getPlacemarkData,
    required this.getPolyline,
    required this.getPositionStream,
  });

}