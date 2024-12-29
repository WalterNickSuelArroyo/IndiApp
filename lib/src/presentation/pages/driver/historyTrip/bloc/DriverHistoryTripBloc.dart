import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indi_app/src/domain/models/AuthResponse.dart';
import 'package:indi_app/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indi_app/src/domain/useCases/client-requests/ClientRequestsUseCases.dart';
import 'package:indi_app/src/domain/utils/Resource.dart';
import 'package:indi_app/src/presentation/pages/driver/historyTrip/bloc/DriverHistoryTripEvent.dart';
import 'package:indi_app/src/presentation/pages/driver/historyTrip/bloc/DriverHistoryTripState.dart';

class DriverHistoryTripBloc extends Bloc<DriverHistoryTripEvent, DriverHistoryTripState> {

  AuthUseCases authUseCases;
  ClientRequestsUseCases clientRequestsUseCases;

  DriverHistoryTripBloc(this.clientRequestsUseCases, this.authUseCases): super(DriverHistoryTripState()) {
    on<GetHistoryTrip>((event, emit) async {
      emit(
        state.copyWith(
          response: Loading()
        )
      );
      AuthResponse authResponse = await authUseCases.getUserSession.run();
      Resource response = await clientRequestsUseCases.getByDriverAssigned.run(authResponse.user.id!);
      emit(
        state.copyWith(
          response: response
        )
      );
    });
  }

}