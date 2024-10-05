import 'package:go_router/go_router.dart';
import 'package:leave_tracker/ui/absence_details/presentation/screens/screen_absence_details.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/ui/home/presentation/screens/screen_home.dart';
///List of router paths
final List<GoRoute> routes = [
  GoRoute(
    path: ScreenHome.routeName,
    builder: (final context, final state) => const ScreenHome(),
    routes: [
      GoRoute(
        path: ScreenAbsenceDetails.routeName,
        builder: (final context, final state) {
          // Extract the Absence object from the route parameters
          final absence = state.extra as Absence;
          return ScreenAbsenceDetails(absence: absence);
        },
      ),
    ],
  ),
];
