part of 'home_cubit.dart';

/// Represents the state of the Home screen.
class HomeState extends Equatable {
  /// The index of the currently selected tab.
  final int? selectedTab;

  /// Creates a [HomeState] instance with an optional [selectedTab].
  const HomeState({this.selectedTab});

  /// Creates a copy of the current state with modified properties.
  HomeState copyWith({
    final int? selectedTab,
  }) {
    return HomeState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [selectedTab];
}

