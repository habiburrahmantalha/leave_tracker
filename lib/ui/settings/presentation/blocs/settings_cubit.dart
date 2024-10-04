import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/core/resource/resource.dart';
import 'package:leave_tracker/core/utils/storage_manager.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({final String? languageCode, final ThemeMode? themeMode}) : super(const SettingsState());

  void setLanguageCode(final String languageCode) {
    StorageManager.instance.setString(R.string.languageCode, languageCode);
    emit(state.copyWith(languageCode: languageCode));
  }

  void setAppTheme(final ThemeMode theme) {
    if (theme == ThemeMode.light) {
      emit(state.copyWith(theme: ThemeMode.light));
    } else if (theme == ThemeMode.dark) {
      emit(state.copyWith(theme: ThemeMode.dark));
    }
  }
}
