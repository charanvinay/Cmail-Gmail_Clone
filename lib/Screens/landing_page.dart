import 'package:cmail/Screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exports.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<bool> checkLogin() async {
    final provider = Provider.of<HomeProvider>(context);
    SharedPreferences pref = await SharedPreferences.getInstance();
    provider.userEmail = pref.getString("user_email") ?? "";
    provider.userId = pref.getString("user_id");
    provider.userPhotoUrl = pref.getString("user_photoUrl") ?? "";
    provider.userDisplayName = pref.getString("user_displayname") ?? "";

    print("email ${provider.userEmail}");

    if (provider.userEmail != "") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkLogin(),
      builder: (context, snapshot) {
        print("Authorization Data: ${snapshot.data}");
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return Scaffold(
        //     body: Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           const CircularProgressIndicator(),
        //         ],
        //       ),
        //     ),
        //   );
        // } else
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        } else {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return HomeScreen();
            } else {
              return const SignInScreen();
            }
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}
