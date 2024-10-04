part of 'settings_cubit.dart';

/// Represents the state of the settings in the application.
///
/// This state includes the user's preferred language and theme mode.
class SettingsState extends Equatable {
  /// The preferred language code of the user (e.g., 'en', 'de').
  final String? languageCode;

  /// The current theme mode (light, dark, or system).
  final ThemeMode? theme;

  /// Creates a new instance of [SettingsState].
  /// The [languageCode] specifies the current language preference,
  /// while [theme] indicates the selected theme mode (light, dark, or system).
  const SettingsState({this.languageCode, this.theme});

  /// Creates a copy of the current state with modified properties.
  SettingsState copyWith({final String? languageCode, final ThemeMode? theme}) {
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
