import 'package:get_it/get_it.dart';
import 'package:gov/services/data_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.allowReassignment = true;
  locator.registerLazySingleton(() => DataService());
}
