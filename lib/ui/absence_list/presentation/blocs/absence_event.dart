part of 'absence_bloc.dart';

sealed class AbsenceEvent extends BaseEventList {
  const AbsenceEvent();
}

class SetFilterEvent extends AbsenceEvent {
  final AbsenceFilter? value;

  const SetFilterEvent(this.value);

  @override
  List<Object?> get props => [value];
}