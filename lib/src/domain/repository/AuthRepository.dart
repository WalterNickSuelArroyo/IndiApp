import 'package:indi_app/src/domain/models/AuthResponse.dart';
import 'package:indi_app/src/domain/models/user.dart';
import 'package:indi_app/src/domain/utils/Resource.dart';

abstract class AuthRepository {

  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<AuthResponse?> getUserSession();
  Future<bool> logout();
}