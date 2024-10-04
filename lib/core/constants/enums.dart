import 'package:flutter/material.dart';
import 'package:leave_tracker/l10n/localization.dart';

/// Represents the status of a loading operation.
///
/// This enum provides different states that can be used to track
/// the progress of asynchronous operations, such as data fetching.
enum LoadingStatus {
  /// The initial state before any loading operation starts.
  initial,

  /// Indicates that a loading operation is currently in progress.
  loading,

  /// Represents a successful completion of the loading operation.
  success,

  /// Indicates that the loading operation has failed.
  failed;

  /// Returns true if the current status is [loading].
  bool get isLoading => this == LoadingStatus.loading;

  /// Returns true if the current status is [success].
  bool get isSuccess => this == LoadingStatus.success;

  /// Returns true if the current status is [failed].
  bool get isFailed => this == LoadingStatus.failed;
}

/// Represents the different types of toast notifications.
///
/// This enum is used to categorize the type of message displayed to the user,
/// allowing for different visual styles or behavior based on the toast type.
enum ToastType {
  /// A regular toast message with neutral styling.
  regular('regular'),

  /// A warning toast message indicating a cautionary situation.
  warning('warning'),

  /// An error toast message indicating a failure or issue.
  error('error'),

  /// A success toast message indicating a successful operation.
  success('success');

  /// Creates a [ToastType] instance with the given [value].
  const ToastType(this.value);

  /// The string representation of the toast type.
  final String value;
}


/// Represents the types of absences that can be recorded.
///
/// This enum is used to differentiate between different absence types,
/// such as vacation or sickness, and provides a way to retrieve
/// localized titles for each type.
enum AbsenceType {
  /// Represents a vacation absence.
  vacation(value: 'vacation'),

  /// Represents a sickness absence.
  sickness(value: 'sickness');

  /// Creates an [AbsenceType] instance with the given [value].
  const AbsenceType({required this.value});

  /// The string representation of the absence type.
  final String value;

  /// Retrieves the localized title for the absence type.
  ///
  /// This method uses the provided [context] to access localization
  /// resources, allowing for the title to be displayed in the current
  /// language.
  String title(final BuildContext context) {
    switch (this) {
      case AbsenceType.vacation:
        return context.local.vacation; // Assuming l10n is set up correctly
      case AbsenceType.sickness:
        return context.local.sickness; // Assuming l10n is set up correctly
    }
  }
}

/// Represents the status of an absence request.
///
/// This enum is used to categorize different states of an absence request,
/// such as requested, confirmed, or rejected, and provides a way to retrieve
/// localized titles for each status.
enum AbsenceStatus {
  /// Represents a requested absence status.
  requested(value: 'requested'),

  /// Represents a confirmed absence status.
  confirmed(value: 'confirmed'),

  /// Represents a rejected absence status.
  rejected(value: 'rejected');

  /// Creates an [AbsenceStatus] instance with the given [value].
  const AbsenceStatus({required this.value});

  /// The string representation of the absence status.
  final String value;

  /// Retrieves the localized title for the absence status.
  ///
  /// This method uses the provided [context] to access localization
  /// resources, allowing for the title to be displayed in the current
  /// language.
  String title(final BuildContext context) {
    switch (this) {
      case AbsenceStatus.requested:
        return context.local.requested; // Assuming l10n is set up correctly
      case AbsenceStatus.confirmed:
        return context.local.confirmed; // Assuming l10n is set up correctly
      case AbsenceStatus.rejected:
        return context.local.rejected; // Assuming l10n is set up correctly
    }
  }
}