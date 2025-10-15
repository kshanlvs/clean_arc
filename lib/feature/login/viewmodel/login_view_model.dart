import 'package:clean_arc/core/netwrok/network_client.dart';
import 'package:clean_arc/feature/login/model/user_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/netwrok/network_exception.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store {
  final NetworkClient _networkClient = sl<NetworkClient>();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  UserModel? user;

  @action
  Future<void> login(String email, String password) async {
    isLoading = true;
    error = null;

    await Future.delayed(const Duration(seconds: 1));
    if (email == "test@example.com" && password == "1234") {
      user = UserModel(email: email);
    } else {
      error = "Invalid credentials";
    }

    isLoading = false;
  }

  @observable
  String? errorMessage;
  @action
  Future<void> fetchData(String email, String password) async {
    isLoading = true;
    errorMessage = null;

    try {
      final data = {
        "email": email,
        "password": password,
      };

      // Example: using your network client to make a POST call
      final response = await _networkClient.post(
        '/login',
        data: data,
      );

      if (kDebugMode) {
        print(response);
      }
    } on NetworkException catch (e) {
      errorMessage = e.message;
    } catch (e) {
      errorMessage = "Unexpected error: $e";
    } finally {
      isLoading = false;
    }
  }
}
