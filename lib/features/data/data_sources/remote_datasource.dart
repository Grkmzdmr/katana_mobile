import 'dart:convert';

import 'package:katana_mobile/core/constants/strings.dart';
import 'package:katana_mobile/core/failures_succeses/exceptions.dart';
import 'package:katana_mobile/core/services/api_service.dart';
import 'package:katana_mobile/core/services/services_locator.dart';
import 'package:katana_mobile/features/data/models/login_model.dart';
import 'package:flutter/material.dart';

abstract class RemoteDataSource {
  Future<LoginModelData> login(String? sign, String? password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService apiService = instance<ApiService>();

  @override
  Future<LoginModelData> login(String? sign, String? password) async {
    try {
      Map<String, dynamic> data = await apiService.getData(Strings.loginUrl, {
        'username': '$sign',
        'password': '$password',
      });

      //LoginModel loginModel = LoginModel.fromMap(data['data']);
      LoginModelData loginModelData = LoginModelData.fromMap(data);
      return loginModelData;
    } catch (e) {
      print(e);
      throw const LoginException(message: "Failed to get data");
    }
  }
}
