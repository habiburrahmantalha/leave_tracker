import 'package:go_router/go_router.dart';
import 'package:leave_tracker/ui/home/presentation/screens/screen_home.dart';

class RouterPaths {

}

final List<GoRoute> routes = [
  GoRoute(
    path: ScreenHome.routeName,
    builder: (context, state) => const ScreenHome(),
  )
];
