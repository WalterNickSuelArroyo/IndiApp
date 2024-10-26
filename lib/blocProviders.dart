

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indi_app/injection.dart';
import 'package:indi_app/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indi_app/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indi_app/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indi_app/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indi_app/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  // BlocProvider<BlocSocketIO>(create: (context) => BlocSocketIO(locator<SocketUseCases>(), locator<AuthUseCases>())),
  BlocProvider<ClientHomeBloc>(create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
  // BlocProvider<DriverHomeBloc>(create: (context) => DriverHomeBloc(locator<AuthUseCases>())),
  // BlocProvider<RolesBloc>(create: (context) => RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  // BlocProvider<ProfileInfoBloc>(create: (context) => ProfileInfoBloc(locator<AuthUseCases>())..add(GetUserInfo())),
  // BlocProvider<ProfileUpdateBloc>(create: (context) => ProfileUpdateBloc(locator<UsersUseCases>(), locator<AuthUseCases>())),
  // BlocProvider<ClientMapSeekerBloc>(create: (context) => ClientMapSeekerBloc(context.read<BlocSocketIO>(), locator<GeolocatorUseCases>(), locator<SocketUseCases>())),
  // BlocProvider<ClientMapBookingInfoBloc>(create: (context) => ClientMapBookingInfoBloc(context.read<BlocSocketIO>(), locator<GeolocatorUseCases>(), locator<ClientRequestsUseCases>(), locator<AuthUseCases>())),
  // BlocProvider<DriverClientRequestsBloc>(create: (context) => DriverClientRequestsBloc(context.read<BlocSocketIO>(), locator<ClientRequestsUseCases>(), locator<DriversPositionUseCases>(), locator<AuthUseCases>(), locator<DriverTripRequestUseCases>())),
  // BlocProvider<ClientDriverOffersBloc>(create: (context) => ClientDriverOffersBloc(context.read<BlocSocketIO>(), locator<DriverTripRequestUseCases>(), locator<ClientRequestsUseCases>())),
  // BlocProvider<DriverMapLocationBloc>(create: (context) => DriverMapLocationBloc(context.read<BlocSocketIO>(), locator<GeolocatorUseCases>(),locator<SocketUseCases>(), locator<AuthUseCases>(), locator<DriversPositionUseCases>())),
  // BlocProvider<DriverCarInfoBloc>(create: (context) => DriverCarInfoBloc(locator<AuthUseCases>(), locator<DriverCarInfoUseCases>())),
  // BlocProvider<ClientMapTripBloc>(create: (context) => ClientMapTripBloc(context.read<BlocSocketIO>(), locator<ClientRequestsUseCases>(), locator<GeolocatorUseCases>(), locator<AuthUseCases>())),
  // BlocProvider<DriverMapTripBloc>(create: (context) => DriverMapTripBloc(context.read<BlocSocketIO>(), locator<ClientRequestsUseCases>(), locator<GeolocatorUseCases>())),
  // BlocProvider<DriverRatingTripBloc>(create: (context) => DriverRatingTripBloc(locator<ClientRequestsUseCases>())),
  // BlocProvider<ClientRatingTripBloc>(create: (context) => ClientRatingTripBloc(locator<ClientRequestsUseCases>())),
  // BlocProvider<DriverHistoryTripBloc>(create: (context) => DriverHistoryTripBloc(locator<ClientRequestsUseCases>(), locator<AuthUseCases>())),
  // BlocProvider<ClientHistoryTripBloc>(create: (context) => ClientHistoryTripBloc(locator<ClientRequestsUseCases>(), locator<AuthUseCases>())),
];