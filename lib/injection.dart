import 'package:get_it/get_it.dart';
import 'package:indi_app/injection.config.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await locator.init();