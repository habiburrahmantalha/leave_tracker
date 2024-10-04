import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/core/base_blocs/base_event_list.dart';
import 'package:leave_tracker/core/resource/resource.dart';
import 'package:leave_tracker/generated/assets.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/ui/absence_list/presentation/blocs/absence_bloc.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/absence_card_view.dart';
import 'package:leave_tracker/widgets/empty_view.dart';
import 'package:leave_tracker/widgets/pagination_list_view.dart';
import 'package:leave_tracker/widgets/raw_button.dart';

class PageAbsenceList extends StatefulWidget {
  const PageAbsenceList({super.key});

  @override
  State<PageAbsenceList> createState() => _PageAbsenceListState();
}

class _PageAbsenceListState extends State<PageAbsenceList> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Absence List"),
        actions: [
          RawButton(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 12),
              onTap: (){},
              child: Image.asset(Assets.imagesFilter, height: 24, color: Theme.of(context).iconTheme.color,)
          ),
          RawButton(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 12),
              onTap: (){},
              child: Image.asset(Assets.imagesFile, height: 24, color: Theme.of(context).iconTheme.color,)
          )
        ],
      ),
      body: BlocBuilder<AbsenceBloc, AbsenceState>(
        builder: (context, state) {
          List<Absence> list = state.list ?? [];
          return PaginationListView(
            padding: EdgeInsets.symmetric(horizontal: R.dimension.screenHorizontalPadding, vertical: R.dimension.screenVerticalPadding),
            status: state.status,
            count: list.length,
            onNotificationUpdate: (ScrollNotification scrollNotification, bool isLoading) {
              if (scrollNotification.metrics.extentAfter < 100 && state.hasNextPage() && !isLoading) {
                context.read<AbsenceBloc>().add(GetListEvent(page: (state.currentPage  ?? 1) + 1,));
              }
              return true;
            },
            itemBuilder: (BuildContext context, int index) {
              return AbsenceCardView(data: list[index]);
            },
            separator: const SizedBox(height: 12,),
            emptyView: EmptyView(
              image: Image.asset(Assets.imagesEmpty),
              title: "Item not found",
            ),
          );
        },
      ),
    );
  }
}
