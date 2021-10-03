import 'package:cmail/Api/google_signin_api.dart';
import 'package:cmail/Screens/sign_in_screen.dart';

import '../../exports.dart';

class Appbar {
  static SliverAppBar appBar(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final searchintext = provider.searchInText;
    return SliverAppBar(
      toolbarHeight: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 1.4,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      titleSpacing: 0,
      title: Text(
        "Search in $searchintext",
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        GestureDetector(
          onTap: () async {
            await GoogleSignInApi.loginOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ),
            );
          },
          child: Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(provider.user.photoUrl!),
              ),
              border: Border.all(
                width: 1.0,
                color: appbarBorderLight,
              ),
            ),
          ),
        ),
      ],
      floating: true,
    );
  }
}
