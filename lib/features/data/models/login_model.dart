import 'package:katana_mobile/features/domain/entities/login.dart';


class LoginModelData extends LoginResponseData{
  LoginModelData({String? data, bool? success})
      : super(data: data, success: success);

    factory LoginModelData.fromMap(Map<String, dynamic> map) {
    return LoginModelData(
        data: map['data'],
        success: map['success'], 
        
        );
    }

}

