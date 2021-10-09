import 'package:cmail/Api/google_signin_api.dart';
import 'package:cmail/Providers/home_provider.dart';
import 'package:cmail/Screens/landing_page.dart';
import 'package:cmail/Screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                homeProvider.setDrawerOption();
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Spacer(),
                    Image.asset(
                      "assets/mail.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    Spacer(flex: 1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.75, 50),
                      ),
                      onPressed: () async {
                        await GoogleSignInApi.loginOut();
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        await pref.clear();
                        // Navigator.of(context).pushReplacement(
                        //   PageTransition(
                        //     child: LandingPage(),
                        //     type: PageTransitionType.rightToLeft,
                        //   ),
                        //   // MaterialPageRoute(
                        //   //   builder: (context) => LandingPage(),
                        //   // ),
                        // );
                        homeProvider.setDrawerOption();
                      },
                      child: Text("Sign out from Cmail"),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
