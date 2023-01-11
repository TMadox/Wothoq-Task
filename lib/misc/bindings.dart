import 'package:get_it/get_it.dart';
import 'package:wothoq_task/services/dio_service.dart';

final locator = GetIt.instance;
void injectDep() {
  //REPOSITORIES///
  locator.registerLazySingleton<DioService>(() => DioService());
}
