import 'package:app_chat_firebase/import_file/import_all.dart';
import 'package:flutter/cupertino.dart';

Future<void> setupAppDependencies()async{
  logger.i('SERVICE starting...');

  await _appService();
  await _appDataProvider();
  Get.put(GlobalKey<NavigatorState>());
  Get.put<AppAutoRoute>(AppAutoRoute(Get.find<GlobalKey<NavigatorState>>()), permanent: true);

}

Future<void> _appService() async{
  // Easy Localization
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  
  // Hive
  var appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.initFlutter();
  await Hive.openBox(AppConstant.keyBoxSetting);
  Hive.registerAdapter(AppConfigModelAdapter());
}

Future<void> _appDataProvider()async{

  var userSecureStorage = UserSecureStorage();
  await userSecureStorage.init();

  // local storage
  Get.put<UserSecureStorage>(userSecureStorage, permanent: true);

  // data repo
  Get.lazyPut<FireBaseAuthRepo>(() => FireBaseAuthRepo(), fenix: true);
  Get.lazyPut<AuthRepo>(() => AuthRepo(), fenix: true);

  //service
  Get.lazyPut<AuthServices>(() => AuthServices(), fenix: true);
}