import 'package:go_router/go_router.dart';
import 'package:leave_tracker/ui/home/presentation/screens/screen_home.dart';
///List of router paths
final List<GoRoute> routes = [
  GoRoute(
    path: ScreenHome.routeName,
    builder: (final context, final state) => const ScreenHome(),
  ),
];
