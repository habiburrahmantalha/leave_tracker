import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/widgets/pagination_list_view.dart';
import 'package:leave_tracker/widgets/loading_indicator.dart';
import 'package:leave_tracker/core/constants/enums.dart';

void main() {
  testWidgets('PaginationListView shows loading indicator when loading', (WidgetTester tester) async {
    // Build the PaginationListView widget in loading state
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PaginationListView(
            status: LoadingStatus.loading,
            count: 0,
            onNotificationUpdate: (scrollNotification, isLoading) => true,
            itemBuilder: (context, index) => const SizedBox(),
          ),
        ),
      ),
    );

    // Verify that the loading indicator is displayed
    expect(find.byType(LoadingIndicator), findsOneWidget);
  });

  testWidgets('PaginationListView shows empty view when empty', (WidgetTester tester) async {
    // Build the PaginationListView widget in success state with no items
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PaginationListView(
            status: LoadingStatus.success,
            count: 0,
            onNotificationUpdate: (scrollNotification, isLoading) => true,
            emptyView: const Text('No data available'),
            itemBuilder: (context, index) => const SizedBox(),
          ),
        ),
      ),
    );

    // Verify that the empty view is displayed
    expect(find.text('No data available'), findsOneWidget);
  });

  testWidgets('PaginationListView displays items correctly', (WidgetTester tester) async {
    // Build the PaginationListView widget in success state with items
    const itemCount = 3;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PaginationListView(
            status: LoadingStatus.success,
            count: itemCount,
            onNotificationUpdate: (scrollNotification, isLoading) => true,
            itemBuilder: (context, index) => Text('Item $index'),
            separator: const Divider(),
          ),
        ),
      ),
    );

    // Verify that the items are displayed
    for (int i = 0; i < itemCount; i++) {
      expect(find.text('Item $i'), findsOneWidget);
    }
  });

  testWidgets('PaginationListView shows loading indicator at the bottom when more items are loading', (WidgetTester tester) async {
    // Build the PaginationListView widget with loading status and items
    const itemCount = 3;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PaginationListView(
            status: LoadingStatus.loading,
            count: itemCount,
            onNotificationUpdate: (scrollNotification, isLoading) => true,
            itemBuilder: (context, index) => Text('Item $index'),
            loadingView: const LoadingIndicator(),
          ),
        ),
      ),
    );

    // Verify that the loading indicator is displayed at the bottom
    expect(find.byType(LoadingIndicator), findsOneWidget);
  });
}
