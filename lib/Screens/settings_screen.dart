import 'package:cmail/Providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                homeProvider.setDrawerOption();
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
        );
      },
    );
  }
}
