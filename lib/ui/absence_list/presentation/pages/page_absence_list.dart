import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/core/base_blocs/base_event_list.dart';
import 'package:leave_tracker/core/resource/resource.dart';
import 'package:leave_tracker/core/utils/utils.dart';
import 'package:leave_tracker/generated/assets.dart';
import 'package:leave_tracker/l10n/localization.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence_filter.dart';
import 'package:leave_tracker/ui/absence_list/presentation/blocs/absence_bloc.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/absence_card_view.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/bottom_sheet_filter.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/selected_filter_view.dart';
import 'package:leave_tracker/widgets/empty_view.dart';
import 'package:leave_tracker/widgets/pagination_list_view.dart';
import 'package:leave_tracker/widgets/raw_button.dart';
import 'package:leave_tracker/widgets/shimmer_absence_card.dart';

/// A widget that represents the absence list page.
class PageAbsenceList extends StatefulWidget {
  /// Creates an instance of [PageAbsenceList].
  const PageAbsenceList({super.key});

  @override
  State<PageAbsenceList> createState() => _PageAbsenceListState();
}

class _PageAbsenceListState extends State<PageAbsenceList> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    return BlocBuilder<AbsenceBloc, AbsenceState>(

      builder: (final context, final state) {
        final List<Absence> list = state.list ?? [];
        return Scaffold(
          appBar: AppBar(
            title: Text(context.local.absence_manager),
            actions: [
              RawButton(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 12),
                  onTap: (){
                    showCustomBottomSheet(context, child: FilterBottomSheet(
                      selectedFilter: state.selectedFilter,
                      onComplete: (final AbsenceFilter value) {
                        Navigator.pop(context);
                        context.read<AbsenceBloc>().add(SetFilterEvent(value));
                      },)
                    ,);
                  },
                  child: Stack(
                    children: [
                      Image.asset(Assets.imagesFilter, height: 24, color: Theme.of(context).iconTheme.color,),
                      if(state.selectedFilter?.isFilterSelected == true)
                        Container(height: 8, width: 8, color: Colors.redAccent,),
                    ],
                  ),
              ),
              RawButton(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 12),
                  onTap: (){},
                  child: Image.asset(Assets.imagesFile, height: 24, color: Theme.of(context).iconTheme.color,),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SelectedFilterView(),
              if(state.status.isSuccess)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: R.dimension.screenHorizontalPadding, vertical: 4),
                child: Text(context.local.absences_found(num.parse(state.totalCount?.toString() ?? '0')), style: Theme.of(context).textTheme.labelLarge,),
              ),
              Expanded(
                child: PaginationListView(
                  padding: EdgeInsets.symmetric(horizontal: R.dimension.screenHorizontalPadding, vertical: R.dimension.screenVerticalPadding),
                  status: state.status,
                  count: list.length,
                  onNotificationUpdate: (final ScrollNotification scrollNotification, final bool isLoading) {
                    if (scrollNotification.metrics.extentAfter < 100 && state.hasNextPage() && !isLoading) {
                      context.read<AbsenceBloc>().add(GetListEvent(page: (state.currentPage  ?? 1) + 1,));
                    }
                    return true;
                  },
                  itemBuilder: (final BuildContext context, final int index) {
                    return AbsenceCardView(data: list[index]);
                  },
                  separator: const SizedBox(height: 12,),
                  emptyView: EmptyView(
                    image: Image.asset(Assets.imagesEmpty),
                    title: state.status.isFailed ? context.local.something_went_wrong_please_try_again : context.local.item_not_found,
                  ),
                  loadingView: list.isEmpty ? const ShimmerCardList() : const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: ShimmerCardView(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
