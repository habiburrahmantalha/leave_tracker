import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/ui/home/presentation/blocs/home_cubit.dart';

void main() {
  group('HomeCubit', () {
    late HomeCubit homeCubit;

    setUp(() {
      homeCubit = HomeCubit();
    });

    tearDown(() {
      homeCubit.close();
    });

    test('initial state is HomeState with null selectedTab', () {
      // Assert
      expect(homeCubit.state, const HomeState());
    });

    test('emits new state with updated selectedTab when setSelectedTab is called', () {
      // Arrange
      const newIndex = 1;

      // Act
      homeCubit.setSelectedTab(newIndex);

      // Assert
      expect(homeCubit.state, HomeState(selectedTab: newIndex));
    });

    test('emits new state with updated selectedTab when setSelectedTab is called multiple times', () {
      // Arrange
      const firstIndex = 0;
      const secondIndex = 1;

      // Act
      homeCubit.setSelectedTab(firstIndex);
      homeCubit.setSelectedTab(secondIndex);

      // Assert
      expect(homeCubit.state, HomeState(selectedTab: secondIndex));
    });
  });
}
