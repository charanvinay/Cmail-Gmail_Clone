import '../exports.dart';

class MeetScreen extends StatefulWidget {
  const MeetScreen({Key? key}) : super(key: key);

  @override
  _MeetScreenState createState() => _MeetScreenState();
}

class _MeetScreenState extends State<MeetScreen> {
  PageController controller = PageController();
  var currentPageValue = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<HomeProvider>(context);
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Meet",
              style: Theme.of(context).textTheme.headline4,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: [
              GestureDetector(
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
                          radius: 14,
                          backgroundColor: provider
                              .colors[provider.userEmail[0].toLowerCase()],
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
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(provider.userPhotoUrl),
                          ),
                        ),
                      ),
              ),
            ],
          ),
          drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: drawer(context),
          ),
          bottomNavigationBar: bottomNav(context: context),
          body: SafeArea(
            child: Column(
              children: [
                //buttons
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          color: lightBlue,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "New meeting",
                              style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                lightBlue.withOpacity(0.1)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Join a meeting",
                              style: TextStyle(
                                color: lightBlue,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // center matter
                Expanded(
                  child: PageView.builder(
                    itemCount: 2,
                    controller: controller,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 50,
                        ),
                        child: Column(
                          children: [
                            Spacer(),
                            Image.asset(
                              provider.meetImages[index],
                              width: MediaQuery.of(context).size.width * 0.7,
                            ),
                            Text(
                              provider.meetTitle[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(height: 15),
                            Text(
                              provider.meetDesc[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Spacer(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPageValue.toInt() == 0
                            ? lightBlue
                            : lightBlue.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPageValue.toInt() == 1
                            ? lightBlue
                            : lightBlue.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }
}
