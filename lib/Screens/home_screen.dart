import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../exports.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("home build");
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Consumer<HomeProvider>(
            builder: (context, homeProvider, _) {
              return homeProvider.currentScreen == 0
                  ? homeProvider.getWidget(context: context)
                  : homeProvider.screens[homeProvider.currentScreen];
            },
          ),
        ),
      ),
    );
  }
}
