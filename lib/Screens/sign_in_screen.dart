import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../exports.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Spacer(flex: 1),
                Text(
                  "Cmail",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 25),
                ),
                Spacer(flex: 2),
                Image.asset(
                  "assets/mail.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                Spacer(flex: 4),
                Text(
                  "Welcome!!!",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 35),
                ),
                SizedBox(height: 10),
                Text(
                  "Why late? Signin fast and check in. Something is waiting for you",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!,
                ),
                Spacer(flex: 4),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Provider.of<HomeProvider>(context, listen: false)
                        .signIn(context);
                  },
                  icon: FaIcon(FontAwesomeIcons.google, color: darkRed),
                  label: Text("Sign in with Google"),
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
