import 'package:katana_mobile/core/failures_succeses/failures.dart';
import 'package:katana_mobile/core/services/services_locator.dart';
import 'package:katana_mobile/features/domain/entities/login.dart';
import 'package:katana_mobile/features/domain/repositories/loginRepository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final LoginRepository loginRepository = instance<LoginRepository>();

  Future<Either<Failure, LoginResponseData>> login(
      String? sign, String? password) {
    return loginRepository.login(sign, password);
  }
}
