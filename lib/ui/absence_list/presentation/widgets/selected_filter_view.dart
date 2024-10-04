import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/ui/absence_list/presentation/blocs/absence_bloc.dart';
import 'package:leave_tracker/widgets/filter_item_button.dart';

/// Displays the currently selected filters for the view.
class SelectedFilterView extends StatelessWidget {
  /// Creates an instance of [SelectedFilterView].
  const SelectedFilterView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      builder: (final context, final state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (final Widget child, final Animation<double> animation) {
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
                      label: state.selectedFilter?.type?.title(context) ?? '',
                      onClear: (){
                        context.read<AbsenceBloc>().add(SetFilterEvent(state.selectedFilter?.copyWith(removeType: true)));
                      },
                    ),
                  if(state.selectedFilter?.status != null)
                    FilterItemButton(
                      label: state.selectedFilter?.status?.title(context) ?? '',
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