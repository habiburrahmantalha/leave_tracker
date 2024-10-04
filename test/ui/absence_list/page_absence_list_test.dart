import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/core/resource/resource.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/member.dart';
import 'package:leave_tracker/ui/absence_list/presentation/blocs/absence_bloc.dart';
import 'package:leave_tracker/core/base_blocs/base_event_list.dart';
import 'package:leave_tracker/core/base_blocs/base_state_list.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/absence_card_view.dart';
import 'package:leave_tracker/ui/absence_list/presentation/pages/page_absence_list.dart';
import 'package:mocktail/mocktail.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/l10n/localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leave_tracker/widgets/shimmer_absence_card.dart';

class MockAbsenceBloc extends Mock implements AbsenceBloc {}
class FakeAbsenceState extends Fake implements AbsenceState {}

void main() {
  late AbsenceBloc mockAbsenceBloc;

  setUp(() {
    mockAbsenceBloc = MockAbsenceBloc();
    registerFallbackValue(FakeAbsenceState());
  });

  group('PageAbsenceList Widget Tests', () {
    testWidgets('displays loading state when AbsenceBloc is loading', (WidgetTester tester) async {
      // Arrange
      when(() => mockAbsenceBloc.state).thenReturn(
        AbsenceState(
          status: LoadingStatus.loading,
          list: [],
        ),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AbsenceBloc>(
            create: (_) => mockAbsenceBloc,
            child: const PageAbsenceList(),
          ),
        ),
      );

      // Assert
      expect(find.byType(ShimmerCardList), findsOneWidget);
    });

    testWidgets('displays list of absences when AbsenceBloc is successful', (WidgetTester tester) async {
      // Arrange
      final List<Absence> absenceList = [
        Absence(id: 1, type: AbsenceType.sickness, status: AbsenceStatus.requested, member: Member(name: "mike", userId: 1)),
        Absence(id: 2, type: AbsenceType.vacation, status: AbsenceStatus.confirmed, member: Member(name: "Li", userId: 2)),
      ];

      when(() => mockAbsenceBloc.state).thenReturn(
        AbsenceState(
          status: LoadingStatus.success,
          list: absenceList,
          totalCount: 2,
        ),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AbsenceBloc>(
            create: (_) => mockAbsenceBloc,
            child: const PageAbsenceList(),
          ),
        ),
      );

      // Assert
      expect(find.byType(AbsenceCardView), findsNWidgets(2));
      expect(find.text('Sick Leave'), findsOneWidget);
      expect(find.text('Vacation'), findsOneWidget);
    });

    testWidgets('displays empty view when no absences are found', (WidgetTester tester) async {
      // Arrange
      when(() => mockAbsenceBloc.state).thenReturn(
        AbsenceState(
          status: LoadingStatus.success,
          list: [],
          totalCount: 0,
        ),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AbsenceBloc>(
            create: (_) => mockAbsenceBloc,
            child: const PageAbsenceList(),
          ),
        ),
      );

      // Assert
      expect(find.text('Item not found'), findsOneWidget);
    });

    testWidgets('opens filter bottom sheet when filter button is tapped', (WidgetTester tester) async {
      // Arrange
      when(() => mockAbsenceBloc.state).thenReturn(
        AbsenceState(
          status: LoadingStatus.success,
          list: [],
        ),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AbsenceBloc>(
            create: (_) => mockAbsenceBloc,
            child: const PageAbsenceList(),
          ),
        ),
      );

      // Act: Tap on filter button
      await tester.tap(find.byKey(const Key('filter_button')));
      await tester.pumpAndSettle();

      // Assert: Filter bottom sheet is opened
      expect(find.byType(BottomSheet), findsOneWidget);
    });

    testWidgets('calls GetListEvent when scrolling near the end of the list', (WidgetTester tester) async {
      // Arrange
      when(() => mockAbsenceBloc.state).thenReturn(
        AbsenceState(
          status: LoadingStatus.success,
          list: List.generate(20, (index) => Absence(id: index, type: AbsenceType.vacation, status: AbsenceStatus.requested,member: Member(name: "mike", userId: 1))),
          totalCount: 100,
          currentPage: 1,
        ),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AbsenceBloc>(
            create: (_) => mockAbsenceBloc,
            child: const PageAbsenceList(),
          ),
        ),
      );

      // Scroll to the bottom of the list
      final listView = find.byType(Scrollable);
      await tester.drag(listView, const Offset(0, -500));
      await tester.pumpAndSettle();

      // Assert: Ensure the event to load the next page is called
      verify(() => mockAbsenceBloc.add(GetListEvent(page: 2))).called(1);
    });
  });
}
