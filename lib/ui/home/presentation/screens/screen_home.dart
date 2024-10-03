import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_tracker/ui/home/presentation/blocs/home_cubit.dart';
import 'package:leave_tracker/ui/settings/presentation/pages/page_settings.dart';

class ScreenHome extends StatefulWidget {
  static const String routeName = "/";

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
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (newPage) {
                context.read<HomeCubit>().setSelectedTab(newPage);
              },
              children: [
                Container(),
                PageSettings()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: state.selectedTab ?? 0,
              iconSize: 24,
              unselectedFontSize: 14,
              selectedFontSize: 14,
              onTap: (index) {
                _controller.jumpToPage(index);
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: "Absence",
                  icon: const Icon(Icons.list),
                ),
                BottomNavigationBarItem(
                  label: "settings",
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


