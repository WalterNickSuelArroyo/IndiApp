
import 'package:indi_app/src/domain/useCases/socket/ConnectSocketUseCase.dart';
import 'package:indi_app/src/domain/useCases/socket/DisconnectSocketuseCase.dart';

class SocketUseCases {

  ConnectSocketUseCase connect;
  DisconnectSocketUseCase disconnect;

  SocketUseCases({
    required this.connect,
    required this.disconnect
  });

}