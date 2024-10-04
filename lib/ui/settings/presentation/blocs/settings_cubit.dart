import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/core/resource/resource.dart';
import 'package:leave_tracker/core/utils/storage_manager.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({final String? languageCode, final ThemeMode? themeMode}) : super(const SettingsState());

  Future<void> setLanguageCode(final String languageCode, {final bool forced = false}) async {
    final String savedLanguageCode = await StorageManager.instance.getString(R.string.languageCode);
    if(savedLanguageCode.isNotEmpty && !forced) {
      emit(state.copyWith(languageCode: savedLanguageCode));
    }else{
      StorageManager.instance.setString(R.string.languageCode, languageCode);
      emit(state.copyWith(languageCode: languageCode));
    }
  }

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
