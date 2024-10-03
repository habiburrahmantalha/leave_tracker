
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/ui/settings/domain/entities/language.dart';
import 'package:leave_tracker/ui/settings/presentation/blocs/settings_cubit.dart';

class PageSettings extends StatelessWidget {
  const PageSettings({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.language, color: Theme.of(context).iconTheme.color),
                const SizedBox(width: 12,),
                Text("Language")
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: languageList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){

                },
                title: Text(languageList[index].title),
                leading: Radio<String>(
                  value: languageList[index].code,
                  groupValue: null,
                  onChanged: (value) {

                  },
                ),
              );
            },
          ),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              ThemeMode themeMode = state.theme ?? (context.isDarkMode ? ThemeMode.dark : ThemeMode.light);
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.palette, color: Theme.of(context).iconTheme.color),
                    const SizedBox(width: 12,),
                    Text("${"Theme"} (${themeMode == ThemeMode.dark ? "Dark" : "Light"})", style: Theme.of(context).textTheme.labelLarge),
                    const Spacer(),
                    Switch(
                      value: themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        context.read<SettingsCubit>().setAppTheme(value ? ThemeMode.dark : ThemeMode.light);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


