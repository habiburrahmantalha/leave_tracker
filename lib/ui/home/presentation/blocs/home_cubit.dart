import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

/// Manages the state of the Home screen using the BLoC pattern.
class HomeCubit extends Cubit<HomeState> {
  /// Creates an instance of [HomeCubit], initializing the state to the default [HomeState].
  HomeCubit() : super(const HomeState());

  /// Updates the currently selected tab index.
  ///
  /// [page] is the index of the tab to be selected.
  void setSelectedTab(final int page) {
    emit(state.copyWith(selectedTab: page));
  }
}
