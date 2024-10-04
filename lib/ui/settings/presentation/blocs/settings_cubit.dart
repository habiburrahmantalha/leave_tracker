import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/core/resource/resource.dart';
import 'package:leave_tracker/core/utils/storage_manager.dart';

part 'settings_state.dart';

/// A Cubit that manages the state of application settings.
///
/// The [SettingsCubit] allows for updating the language preference and theme mode of the application.
class SettingsCubit extends Cubit<SettingsState> {
  /// Creates a [SettingsCubit] instance.
  ///
  /// Optionally initializes the cubit with a [languageCode] and [themeMode].
  /// If not provided, the cubit will start with default settings.
  SettingsCubit({final String? languageCode, final ThemeMode? themeMode}) : super(const SettingsState());

  /// Updates the language code in the current state.
  ///
  /// This method emits a new [SettingsState] with the updated [languageCode].
  ///
  /// [languageCode] must not be null.
  Future<void> setLanguageCode(final String languageCode, {final bool forced = false}) async {
    final String savedLanguageCode = await StorageManager.instance.getString(R.string.languageCode);
    if(savedLanguageCode.isNotEmpty && !forced) {
      emit(state.copyWith(languageCode: savedLanguageCode));
    }else{
      StorageManager.instance.setString(R.string.languageCode, languageCode);
      emit(state.copyWith(languageCode: languageCode));
    }
  }

  /// Updates the application theme mode in the current state.
  ///
  /// This method emits a new [SettingsState] with the updated [theme].
  ///
  /// [theme] must not be null.
  Future<void> setAppTheme(final ThemeMode themeMode, {final bool forced = false}) async {
    final String savedThemeMode = await StorageManager.instance.getString(R.string.themeMode);
    if(savedThemeMode.isNotEmpty && !forced) {
      emit(state.copyWith(theme: savedThemeMode == ThemeMode.light.name ? ThemeMode.light : ThemeMode.dark));
    }else{
      StorageManager.instance.setString(R.string.themeMode, themeMode.name);
      emit(state.copyWith(theme: themeMode));
    }
  }
}
