import 'package:bloc/bloc.dart';
import 'package:katana_mobile/core/failures_succeses/failures.dart';
import 'package:katana_mobile/core/services/services_locator.dart';
import 'package:katana_mobile/features/data/models/login_model.dart';
import 'package:katana_mobile/features/domain/entities/login.dart';
import 'package:katana_mobile/features/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.usernameController, this.passwordController, this.formKey)
      : super(LoginInitial());
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  final LoginUseCase _loginUseCase = instance<LoginUseCase>();

  void login(String? sign, String? password
      ) async {
    if (sign!.isEmpty || password!.isEmpty) {
      emit(LoginEmptyBoxError());
      return;
    }

    emit(LoginLoading());

    final Either<Failure, LoginResponseData> loginResult =
        await _loginUseCase.login(sign, password);
    loginResult.fold((l) {
      emit(LoginError());
     
    }, (r) {
      emit(LoginFinished(loginResponseData: r));
    });
  }
}
