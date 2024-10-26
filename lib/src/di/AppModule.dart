import 'package:indi_app/src/data/dataSource/local/SharePref.dart';
import 'package:indi_app/src/data/dataSource/remote/services/AuthService.dart';
import 'package:indi_app/src/data/repository/AuthRepositoryImpl.dart';
import 'package:indi_app/src/domain/repository/AuthRepository.dart';
import 'package:indi_app/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indi_app/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:indi_app/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:indi_app/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:indi_app/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:indi_app/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  @injectable
  SharefPref get sharefPref => SharefPref();

  // @injectable
  // Socket get socket => io('http://${ApiConfig.API_PROJECT}', 
  //   OptionBuilder()
  //     .setTransports(['websocket']) // for Flutter or Dart VM
  //     .disableAutoConnect()  // disable auto-connection
  //     .build()
  // );

  // @injectable
  // Future<String> get token async {
  //   String token = '';
  //   final userSession = await sharefPref.read('user');
  //   if (userSession != null) {
  //     AuthResponse authResponse = AuthResponse.fromJson(userSession);
  //     token = authResponse.token;
  //   }
  //   return token;
  // }

  @injectable
  AuthService get authService => AuthService();

  // @injectable
  // UsersService get usersService => UsersService(token);

  // @injectable
  // DriversPositionService get driversPositionService => DriversPositionService();

  // @injectable
  // ClientRequestsService get clientRequestsService => ClientRequestsService();

  // @injectable
  // DriverTripRequestsService get driverTripRequestsService => DriverTripRequestsService();

  // @injectable
  // DriverCarInfoService get driverCarInfoService => DriverCarInfoService();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharefPref);

  // @injectable
  // UsersRepository get usersRepository => UsersRepositoryImpl(usersService);

  // @injectable
  // SocketRepository get socketRepository => SocketRepositoryImpl(socket);

  // @injectable
  // ClientRequestsRepository get clientRequestsRepository => ClientRequestsRepositoryImpl(clientRequestsService);

  // @injectable
  // GeolocatorRepository get geolocatorRepository => GeolocatorRepositoryImpl();

  // @injectable
  // DriverPositionRepository get driversPositionRepository => DriversPositionRepositoryImpl(driversPositionService);

  // @injectable
  // DriverTripRequestsRepository get driverTripRequestsRepository => DriverTripRequestsRepositoryImpl(driverTripRequestsService);

  // @injectable
  // DriverCarInfoRepository get driverCarInfoRepository => DriverCarInfoRepositoryImpl(driverCarInfoService);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository)
  );

  //  @injectable
  //  UsersUseCases get usersUseCases => UsersUseCases(
  //   update: UpdateUserUseCase(usersRepository),
  //   updateNotificationToken: UpdateNotificationTokenUseCase(usersRepository)
  // );

  // @injectable
  //  GeolocatorUseCases get geolocatorUseCases => GeolocatorUseCases(
  //   findPosition: FindPositionUseCase(geolocatorRepository),
  //   createMarker: CreateMarkerUseCase(geolocatorRepository),
  //   getMarker: GetMarkerUseCase(geolocatorRepository),
  //   getPlacemarkData: GetPlacemarkDataUseCase(geolocatorRepository),
  //   getPolyline: GetPolylineUseCase(geolocatorRepository),
  //   getPositionStream: GetPositionStreamUseCase(geolocatorRepository)
  // );

  // @injectable
  //  SocketUseCases get socketUseCases => SocketUseCases(
  //   connect: ConnectSocketUseCase(socketRepository),
  //   disconnect: DisconnectSocketUseCase(socketRepository)
  // );

  // @injectable
  //  DriversPositionUseCases get driversPositionUseCases => DriversPositionUseCases(
  //   createDriverPosition: CreateDriverPositionUseCase(driversPositionRepository),
  //   deleteDriverPosition: DeleteDriverPositionUseCase(driversPositionRepository),
  //   getDriverPosition: GetDriverPositionUseCase(driversPositionRepository)
  // );

  // @injectable
  //  ClientRequestsUseCases get clientRequestsUseCases => ClientRequestsUseCases(
  //   createClientRequest: CreateClientRequestUseCase(clientRequestsRepository),
  //   getTimeAndDistance: GetTimeAndDistanceUseCase(clientRequestsRepository),
  //   getNearbyTripRequest: GetNearbyTripRequestUseCase(clientRequestsRepository),
  //   updateDriverAssigned: UpdateDriverAssignedUseCase(clientRequestsRepository),
  //   getByClientRequest: GetByClientRequestUseCase(clientRequestsRepository),
  //   updateStatusClientRequest: UpdateStatusClientRequestUseCase(clientRequestsRepository),
  //   updateClientRating: UpdateClientRatingUseCase(clientRequestsRepository),
  //   updateDriverRating: UpdateDriverRatingUseCase(clientRequestsRepository),
  //   getByClientAssigned: GetByClientAssignedUseCase(clientRequestsRepository),
  //   getByDriverAssigned: GetByDriverAssignedUseCase(clientRequestsRepository)
  // );

  // @injectable
  //  DriverTripRequestUseCases get driverTripRequestUseCases => DriverTripRequestUseCases(
  //   createDriverTripRequest: CreateDriverTripRequestUseCase(driverTripRequestsRepository),
  //   getDriverTripOffersByClientRequest: GetDriverTripOffersByClientRequestUseCase(driverTripRequestsRepository)
  // );

  // @injectable
  //  DriverCarInfoUseCases get driverCarInfoUseCases => DriverCarInfoUseCases(
  //   createDriverCarInfo: CreateDriverCarInfoUseCase(driverCarInfoRepository),
  //   getDriverCarInfo: GetDriverCarInfoUseCase(driverCarInfoRepository)
  // );

}