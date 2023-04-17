import 'package:app_chat_firebase/route/routes_import.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app_chat_firebase/screens/screens_import.dart';
part 'general_auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Dialog,Route',
  routes: <AutoRoute>[
    loginPage,
  ],
)
class $AppAutoRoute {}
//class AppAutoRoute extends _$AppAutoRoute {}