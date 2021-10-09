import '../../exports.dart';

class Appbar {
  static SliverAppBar appBar(BuildContext context) {
    // final provider = Provider.of<HomeProvider>(context, listen: false);
    final searchintext =
        Provider.of<HomeProvider>(context, listen: false).searchInText;
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
        Consumer<HomeProvider>(builder: (context, provider, _) {
          return GestureDetector(
            // onTap: () async {
            //   await GoogleSignInApi.loginOut();
            //   Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(
            //       builder: (context) => SignInScreen(),
            //     ),
            //   );
            // },
            onTap: () {
              provider.signIn(context);
            },
            child: provider.userPhotoUrl == ""
                ? Container(
                    margin: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor:
                          provider.colors[provider.userEmail[0].toLowerCase()],
                      child: Container(
                        child: Text(
                          provider.userEmail[0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "Product Sans",
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(provider.userPhotoUrl),
                      ),
                    ),
                  ),
          );
        })
      ],
      floating: true,
    );
  }
}
