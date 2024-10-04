import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/ui/absence_list/presentation/blocs/absence_bloc.dart';
import 'package:leave_tracker/widgets/filter_item_button.dart';

class SelectedFilterView extends StatelessWidget {
  const SelectedFilterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            // Customize the transition effect
            return FadeTransition(opacity: animation, child: child);
          },
          child: Visibility(
            visible: state.selectedFilter?.isFilterSelected == true,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  if(state.selectedFilter?.type != null)
                    FilterItemButton(
                      label: state.selectedFilter?.type?.title ?? "",
                      onClear: (){
                        context.read<AbsenceBloc>().add(SetFilterEvent(state.selectedFilter?.copyWith(removeType: true)));
                      },
                    ),
                  if(state.selectedFilter?.status != null)
                    FilterItemButton(
                      label: state.selectedFilter?.status?.title ?? "",
                      onClear: (){
                        context.read<AbsenceBloc>().add(SetFilterEvent(state.selectedFilter?.copyWith(removeStatus: true)));
                      },
                    ),
                  if(state.selectedFilter?.dateTimeRange != null)
                    FilterItemButton(
                      label: "${state.selectedFilter?.dateTimeRange?.start.toddMMMyy() ?? ""} - ${state.selectedFilter?.dateTimeRange?.end.toddMMMyy() ?? ""}",
                      onClear: (){
                        context.read<AbsenceBloc>().add(SetFilterEvent(state.selectedFilter?.copyWith(removeDateTimeRange: true)));
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}