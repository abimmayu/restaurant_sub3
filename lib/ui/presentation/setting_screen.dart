import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/preference_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Consumer<PreferencesProvider>(
          builder: (context, provider, child) {
            return Material(
              child: ListTile(
                title: const Text('Scheduling The News'),
                trailing: Consumer<SchedulingProvider>(
                  builder: (context, scheduled, _) {
                    return Switch.adaptive(
                        value: provider.isDailyNewsActive,
                        onChanged: (value) async {
                          scheduled.scheduledNews(value);
                          provider.enableDailyNews(value);
                        });
                  },
                ),
              ),
            );
          },
        ));
  }
}
