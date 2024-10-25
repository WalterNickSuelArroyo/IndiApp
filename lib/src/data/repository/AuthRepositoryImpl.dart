// import 'package:indriver_clone_flutter/src/data/dataSource/local/SharefPref.dart';
// import 'package:indriver_clone_flutter/src/domain/models/user.dart';

import 'package:indi_app/src/data/dataSource/remote/services/AuthService.dart';
import 'package:indi_app/src/domain/models/AuthResponse.dart';
import 'package:indi_app/src/domain/repository/AuthRepository.dart';
import 'package:indi_app/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  
  AuthService authService;

  AuthRepositoryImpl(this.authService);
  // SharefPref sharefPref;

  // AuthRepositoryImpl(this.authService, this.sharefPref);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  // @override
  // Future<Resource<AuthResponse>> register(User user) {
  //   return authService.register(user);
  // }
  
  // @override
  // Future<AuthResponse?> getUserSession() async {
  //   final data = await sharefPref.read('user');
  //   if (data != null) {
  //     AuthResponse authResponse = AuthResponse.fromJson(data);
  //     return authResponse;
  //   }
  //   return null;
  // }
  
  // @override
  // Future<void> saveUserSession(AuthResponse authResponse) async {
  //   sharefPref.save('user', authResponse.toJson());
  // }
  
  // @override
  // Future<bool> logout() async {
  //   return await sharefPref.remove('user');
  // }

}