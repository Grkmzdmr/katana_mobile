import 'package:katana_mobile/core/services/api_service.dart';
import 'package:katana_mobile/features/data/data_sources/remote_datasource.dart';
import 'package:katana_mobile/features/data/repositories/login_repo_impl.dart';
import 'package:katana_mobile/features/domain/repositories/loginRepository.dart';
import 'package:katana_mobile/features/domain/usecases/login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt instance = GetIt.instance;

void setUpServices() {
  instance.registerSingleton<Dio>(Dio());
  instance.registerSingleton<ApiService>(ApiServiceImpl());
  instance.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl());
  instance.registerSingleton<LoginRepository>(LoginRepoImpl());
  instance.registerSingleton<LoginUseCase>(LoginUseCase());
}
