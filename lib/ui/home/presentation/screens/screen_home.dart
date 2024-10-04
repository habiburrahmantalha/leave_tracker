import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/core/base_blocs/base_event_list.dart';
import 'package:leave_tracker/generated/assets.dart';
import 'package:leave_tracker/l10n/localization.dart';
import 'package:leave_tracker/ui/absence_list/data/repositories/repository_absence_list_implementation.dart';
import 'package:leave_tracker/ui/absence_list/domain/usecases/usecase_absence_list.dart';
import 'package:leave_tracker/ui/absence_list/presentation/blocs/absence_bloc.dart';
import 'package:leave_tracker/ui/absence_list/presentation/pages/page_absence_list.dart';
import 'package:leave_tracker/ui/home/presentation/blocs/home_cubit.dart';
import 'package:leave_tracker/ui/settings/presentation/pages/page_settings.dart';

///Home screen widget
class ScreenHome extends StatefulWidget {
  ///named route for home screen
  static const String routeName = '/';

  ///Creates instance
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() {
    return _ScreenHomeState();
  }
}

class _ScreenHomeState extends State<ScreenHome> {

  late PageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PageController(

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (final context, final state) {
          return Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (final newPage) {
                context.read<HomeCubit>().setSelectedTab(newPage);
              },
              children: [
                BlocProvider(
                  create: (final context) => AbsenceBloc(UseCaseAbsenceList(RepositoryAbsenceListImplementation()))
                    ..add(const GetListEvent()),
                  child: const PageAbsenceList(),
                ),
                const PageSettings(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: state.selectedTab ?? 0,
              unselectedFontSize: 14,
              onTap: (final index) {
                _controller.jumpToPage(index);
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: context.local.absences,
                  icon: Image.asset(Assets.imagesAbsent, height: 24, color: Theme.of(context).iconTheme.color,),
                ),
                BottomNavigationBarItem(
                  label: context.local.settings,
                  icon: Image.asset(Assets.imagesSettings, height: 24, color: Theme.of(context).iconTheme.color,),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


