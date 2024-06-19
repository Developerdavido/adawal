
import 'package:get_it/get_it.dart';

import '../services/http_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerSingleton<HttpService>(HttpService());
}