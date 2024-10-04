import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Extension for location easy access to generated location object
extension AppLocalizationsExtension on BuildContext {
  /// Access the localized strings via [AppLocalizations].
  AppLocalizations get local => AppLocalizations.of(this);
}