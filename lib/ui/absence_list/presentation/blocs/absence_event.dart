part of 'absence_bloc.dart';

/// Represents the base class for all absence-related events.
///
/// This class extends [BaseEventList] and serves as a sealed class
/// for organizing absence-specific events.
sealed class AbsenceEvent extends BaseEventList {
  const AbsenceEvent();
}

/// An event for setting the absence filter.
///
/// This event holds the selected filter value and notifies the
/// [AbsenceBloc] to update the state based on the new filter.
class SetFilterEvent extends AbsenceEvent {
  /// The selected absence filter value.
  final AbsenceFilter? value;

  /// Creates an instance of [SetFilterEvent].
  ///
  /// Takes an optional [value] parameter representing the selected
  /// absence filter. If null, it indicates no filter is applied.
  const SetFilterEvent(this.value);

  @override
  List<Object?> get props => [value];
}