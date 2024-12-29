import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indi_app/blocProviders.dart';
import 'package:indi_app/injection.dart';
import 'package:indi_app/src/domain/utils/FirebasePushNotifications.dart';
import 'package:indi_app/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:indi_app/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indi_app/src/presentation/pages/client/driverOffers/ClientDriverOffersPage.dart';
import 'package:indi_app/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:indi_app/src/presentation/pages/client/mapBookingInfo/ClientMapBookingInfoPage.dart';
import 'package:indi_app/src/presentation/pages/client/mapTrip/ClientMapTripPage.dart';
import 'package:indi_app/src/presentation/pages/client/ratingTrip/ClientRatingTripPage.dart';
import 'package:indi_app/src/presentation/pages/driver/clientRequests/DriverClientRequestsPage.dart';
import 'package:indi_app/src/presentation/pages/driver/home/DriverHomePage.dart';
import 'package:indi_app/src/presentation/pages/driver/mapTrip/DriverMapTripPage.dart';
import 'package:indi_app/src/presentation/pages/driver/ratingTrip/DriverRatingTripPage.dart';
import 'package:indi_app/src/presentation/pages/profile/update/ProfileUpdatePage.dart';
import 'package:indi_app/src/presentation/pages/roles/RolesPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onMessageListener();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => const LoginPage(),
          'register': (BuildContext context) => const RegisterPage(),
          'roles': (BuildContext context) => RolesPage(),
          'client/home': (BuildContext context) => const ClientHomePage(),
          'driver/home': (BuildContext context) => DriverHomePage(),
          'client/map/booking': (BuildContext context) => ClientMapBookingInfoPage(),
          'profile/update': (BuildContext context) => const ProfileUpdatePage(),
          'client/driver/offers': (BuildContext context) => ClientDriverOffersPage(),
          'client/map/trip': (BuildContext context) => ClientMapTripPage(),
          'driver/map/trip': (BuildContext context) => DriverMapTripPage(),
          'driver/rating/trip': (BuildContext context) => DriverRatingTripPage(),
          'driver/client/request': (BuildContext context) => DriverClientRequestsPage(),
          'client/rating/trip': (BuildContext context) => ClientRatingTripPage(),
        },
      ),
    );
  }
}
