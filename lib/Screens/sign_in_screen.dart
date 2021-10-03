import 'package:cmail/Api/google_signin_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../exports.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  get label => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: signIn,
              icon: FaIcon(FontAwesomeIcons.google, color: darkRed),
              label: Text("Sign in with Google"),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sign in Failed"),
        ),
      );
    } else {
      Provider.of<HomeProvider>(context, listen: false).setUserAccount(user);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }
}
