import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/core/base_blocs/base_event_list.dart';
import 'package:leave_tracker/core/base_blocs/base_state_list.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/utils/utils.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence_filter.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/response_absence.dart';
import 'package:leave_tracker/ui/absence_list/domain/usecases/usecase_absence_list.dart';

part 'absence_event.dart';
part 'absence_state.dart';

/// Represents the BLoC for managing the absence list.
///
/// This BLoC handles events related to the absence list,
/// including fetching, filtering, and updating absence data.
class AbsenceBloc extends Bloc<BaseEventList, AbsenceState> {
  /// The use case responsible for interacting with the absence data.
  UseCaseAbsenceList useCase;
  /// Creates an instance of [AbsenceBloc].
  ///
  /// Takes a [useCase] parameter to handle absence-related operations
  /// and initializes the state to an empty [AbsenceState].
  AbsenceBloc(this.useCase) : super(const AbsenceState()) {

    on<BaseEventList>((final event, final emit) async {
      switch(event){
        case GetListEvent():
          if(true){
            final int page = event.page ?? (state.currentPage ?? 1);
            emit(state.copyWith(
                status: LoadingStatus.loading,
                currentPage: page,
                list: page == 1 ? [] : state.list ?? [],
            ),);
            try{
              final ResponseAbsenceList response = await useCase.getAbsenceList(filter: (state.selectedFilter ?? const AbsenceFilter()).toQueryParameter(page));
              final List<Absence> list = state.list ?? [];
              list.addAll(response.list);

              emit(state.copyWith(
                  status: LoadingStatus.success,
                  currentPage: response.currentPage,
                  totalCount: response.totalCount,
                  totalPage: response.totalPage,
                  list: list,
              ),);
            }catch(e){
              printDebug('GetListEvent $e');
              emit(state.copyWith(status: LoadingStatus.failed));
            }
          }
        case ResetListEvent():
          break;
      }
    });

    on<AbsenceEvent>((final event, final emit) {
      switch(event){
        case SetFilterEvent():
          emit(state.copyWith(selectedFilter: event.value));
          add(const GetListEvent(page: 1));
      }
    });
  }
}
