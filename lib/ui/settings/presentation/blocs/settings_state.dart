part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final String languageCode;
  final ThemeMode theme;

  const SettingsState({this.languageCode = 'en', this.theme = ThemeMode.light});

  SettingsState copyWith({String? languageCode, ThemeMode? theme}) {
    return SettingsState(
      languageCode: languageCode ?? this.languageCode,
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object?> get props => [
        languageCode,
        theme,
      ];
}
