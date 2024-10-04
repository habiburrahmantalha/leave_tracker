import 'package:go_router/go_router.dart';
import 'package:leave_tracker/ui/home/presentation/screens/screen_home.dart';
///List of router paths
final List<GoRoute> routes = [
  GoRoute(
    path: ScreenHome.routeName,
    builder: (final context, final state) => const ScreenHome(),
    // routes: [
    //   GoRoute(
    //     path: '/absence',
    //     builder: (context, state) {
    //       // Extracting query parameters from the URL
    //       final filterType = state.uri.queryParameters['filterType'];
    //       final date = state.uri.queryParameters['date'];
    //
    //       return AbsenceScreen(filterType: filterType, date: date);
    //     },
    //     routes: [
    //       GoRoute(
    //         path: ScreenTaskCreate.routeName,
    //         builder: (context, state) => BlocProvider(
    //           create: (context) => TaskBloc(repository: RepositoryTaskImplementation()),
    //           child: ScreenTaskCreate(task: state.extra as Task?),
    //         ),
    //       ),
    //     ]
    //   ),
    // ]
  ),
];
