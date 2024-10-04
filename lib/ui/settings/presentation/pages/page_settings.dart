
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leave_tracker/core/resource/theme.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/l10n/localization.dart';
import 'package:leave_tracker/ui/settings/domain/entities/language.dart';
import 'package:leave_tracker/ui/settings/presentation/blocs/settings_cubit.dart';
import 'package:leave_tracker/widgets/loading_indicator.dart';
import 'package:leave_tracker/widgets/tag_view.dart';

class PageSettings extends StatelessWidget {
  const PageSettings({super.key});

  @override
  Widget build(final BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(context.local.settings),),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (final context, final state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.language, color: Theme.of(context).iconTheme.color),
                    const SizedBox(width: 12,),
                    Text(context.local.language)
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: languageList.length,
                itemBuilder: (final context, final index) {
                  return ListTile(
                    onTap: (){
                      context.read<SettingsCubit>().setLanguageCode(languageList[index].code, forced: true);
                    },
                    title: Text(languageList[index].title),
                    leading: Radio<String>(
                      value: languageList[index].code,
                      groupValue: state.languageCode,
                      onChanged: (final value) {
                        context.read<SettingsCubit>().setLanguageCode(languageList[index].code, forced: true);
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.palette, color: Theme.of(context).iconTheme.color),
                    const SizedBox(width: 12,),
                    Text('${context.local.theme} (${context.isDarkMode ? context.local.dark : context.local.light})', style: Theme.of(context).textTheme.labelLarge),
                    const Spacer(),
                    Switch(
                      value: state.theme == ThemeMode.dark,
                      onChanged: (final value) {
                        context.read<SettingsCubit>().setAppTheme(value ? ThemeMode.dark : ThemeMode.light, forced: true);
                      },
                    ),
                  ],
                ),
              ),
              if(kDebugMode)
                const WidgetColorCheck()
            ],
          );
        },
      ),
    );
  }
}

class WidgetColorCheck extends StatelessWidget {
  const WidgetColorCheck({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text('Widget Color Check', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12,),
          const LoadingIndicator(),
          TagView(color: Theme.of(context).extension<CustomStatusColors>()?.requestedColor.withOpacity(0.4),child: Text('Pending', style: Theme.of(context).textTheme.titleMedium) ,),
          const SizedBox(height: 12,),
          TagView(color: Theme.of(context).extension<CustomStatusColors>()?.rejectedColor.withOpacity(0.4),child: Text('Rejected', style: Theme.of(context).textTheme.titleMedium) ,),
          const SizedBox(height: 12,),
          TagView(color: Theme.of(context).extension<CustomStatusColors>()?.confirmedColor.withOpacity(0.4),child: Text('Confirmed', style: Theme.of(context).textTheme.titleMedium) ,),
          const SizedBox(height: 12,),
          TagView(color: Theme.of(context).extension<CustomStatusColors>()?.vacationColor.withOpacity(0.4),child: Text('Vacation', style: Theme.of(context).textTheme.titleMedium) ,),
          const SizedBox(height: 12,),
          TagView(color: Theme.of(context).extension<CustomStatusColors>()?.sicknessColor.withOpacity(0.4),child: Text('Sickness', style: Theme.of(context).textTheme.titleMedium) ,),
        ],
      ),
    );
  }
}

