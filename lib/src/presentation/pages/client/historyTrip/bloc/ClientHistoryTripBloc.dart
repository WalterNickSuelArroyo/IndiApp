import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indi_app/src/domain/models/AuthResponse.dart';
import 'package:indi_app/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indi_app/src/domain/useCases/client-requests/ClientRequestsUseCases.dart';
import 'package:indi_app/src/domain/utils/Resource.dart';
import 'package:indi_app/src/presentation/pages/client/historyTrip/bloc/ClientHistoryTripEvent.dart';
import 'package:indi_app/src/presentation/pages/client/historyTrip/bloc/ClientHistoryTripState.dart';


class ClientHistoryTripBloc extends Bloc<ClientHistoryTripEvent, ClientHistoryTripState> {

  AuthUseCases authUseCases;
  ClientRequestsUseCases clientRequestsUseCases;

  ClientHistoryTripBloc(this.clientRequestsUseCases, this.authUseCases): super(ClientHistoryTripState()) {
    on<GetHistoryTrip>((event, emit) async {
      emit(
        state.copyWith(
          response: Loading()
        )
      );
      AuthResponse authResponse = await authUseCases.getUserSession.run();
      Resource response = await clientRequestsUseCases.getByClientAssigned.run(authResponse.user.id!);
      emit(
        state.copyWith(
          response: response
        )
      );
    });
  }

}