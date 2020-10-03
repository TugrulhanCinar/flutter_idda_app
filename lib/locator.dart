import 'package:flutteriddaapp/data/kupon_servis.dart';
import 'package:flutteriddaapp/data/kupons_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

setUpLocator() {
  locator.registerLazySingleton(() => KuponClient());
  locator.registerLazySingleton(() => KuponRepository());
}
