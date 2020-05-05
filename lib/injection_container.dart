import 'package:get_it/get_it.dart';
import 'package:interview_app/services/dialog_service.dart';
import 'package:interview_app/services/navigation_service.dart';


GetIt sl = GetIt.instance;

// void setupsl() {
//   sl.registerLazySingleton(() => NavigationService());
//   sl.registerLazySingleton(() => DialogService());
// }
Future<void> init() async{
  //!Services
 sl.registerLazySingleton(() => NavigationService());
 sl.registerLazySingleton(() => DialogService());
  
}