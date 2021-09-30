import 'package:cmail/Providers/chats_provider.dart';
import 'package:cmail/Providers/mail_provider.dart';
import 'package:cmail/Providers/rooms_provider.dart';
import 'package:cmail/theme.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'exports.dart';

void main() {
  // GestureBinding.instance!.resamplingEnabled = true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<MailProvider>(create: (_) => MailProvider()),
        ChangeNotifierProvider<ChatsProvider>(create: (_) => ChatsProvider()),
        ChangeNotifierProvider<RoomsProvider>(create: (_) => RoomsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bgColorDark,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Cmail',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
