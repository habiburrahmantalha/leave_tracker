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

class AbsenceBloc extends Bloc<BaseEventList, AbsenceState> {

  UseCaseAbsenceList useCase;

  AbsenceBloc(this.useCase) : super(AbsenceState()) {

    on<BaseEventList>((event, emit) async {
      switch(event){
        case GetListEvent():
          if(true){
            int page = event.page ?? (state.currentPage ?? 1);
            emit(state.copyWith(
                status: LoadingStatus.loading,
                currentPage: page,
                list: page == 1 ? [] : state.list ?? []
            ));
            try{
              ResponseAbsenceList response = await useCase.getAbsenceList(filter: state.selectedFilter?.toQueryParameter(page));
              List<Absence> list = state.list ?? [];
              list.addAll(response.list);

              emit(state.copyWith(
                  status: LoadingStatus.success,
                  currentPage: response.currentPage,
                  totalCount: response.totalCount,
                  totalPage: response.totalPage,
                  list: list
              ));
            }catch(e){
              printDebug("GetListEvent $e");
              emit(state.copyWith(status: LoadingStatus.failed));
            }
          }
        case ResetListEvent():
          break;
      }
    });

    on<AbsenceEvent>((event, emit) {
      switch(event){
        case SetFilterEvent():
          emit(state.copyWith(selectedFilter: event.value));
          add(GetListEvent(page: 1));
      }
    });
  }
}
