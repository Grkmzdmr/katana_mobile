import 'package:katana_mobile/core/failures_succeses/failures.dart';
import 'package:katana_mobile/features/domain/entities/login.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseData>> login(
      String? sign, String? password);
}
