import 'package:page_transition/page_transition.dart';

import '../exports.dart';

class MailsScreen extends StatefulWidget {
  const MailsScreen({Key? key, this.isSent = false}) : super(key: key);
  final bool? isSent;

  @override
  _MailsScreenState createState() => _MailsScreenState();
}

class _MailsScreenState extends State<MailsScreen> {
  late String email;
  late ScrollController mailController;
  bool isFabVisible = true;
  @override
  void initState() {
    mailController = ScrollController();
    mailController.addListener(() {
      setState(() {
        isFabVisible = mailController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   final provider = Provider.of<HomeProvider>(context, listen: true);
  //   provider.controller = ScrollController();
  //   // provider.controller.addListener(() {
  //   //   provider.setScroll();
  //   // });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext homeContext) {
    return Scaffold(
      floatingActionButton: fab(
        context,
        "Compose",
        Icons.edit_outlined,
        () {
          //     Navigator.of(context).pushReplacement(PageTransition(
          //   child: HomeScreen(),
          //   type: PageTransitionType.leftToRight,
          // )
          Navigator.push(
            context,
            PageTransition(
              child: ComposeMail(),
              type: PageTransitionType.bottomToTop,
              // MaterialPageRoute(
              //   builder: (context) => ComposeMail(),
              // ),
            ),
          );
        },
        isFabVisible,
      ),
      bottomNavigationBar:
          bottomNav(context: context, fabIsVisible: isFabVisible),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: drawer(context),
      ),
      body: CustomScrollView(
        controller: mailController,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: Appbar.appBar(homeContext),
          ),
          SliverToBoxAdapter(
            child: Consumer<HomeProvider>(
              builder: (context, homeProvider, _) {
                final image = homeProvider.images[homeProvider.drawerOption];
                final bool isSocial = (homeProvider.drawerOption == "Social" ||
                    homeProvider.drawerOption == "Promotions" ||
                    homeProvider.drawerOption == "Calendar" ||
                    homeProvider.drawerOption == "Contacts" ||
                    homeProvider.drawerOption == "Settings" ||
                    homeProvider.drawerOption == "Help & feedback");
                return homeProvider.mailsList.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // primary text
                            HeadingText(text: homeProvider.drawerOption),
                            ListView.builder(
                              itemCount: homeProvider.mailsList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                return MailTile(
                                  mail: homeProvider.mailsList[index],
                                  index: index,
                                  isSent: widget.isSent!,
                                );
                              },
                            )
                          ],
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height - 400,
                        margin: EdgeInsets.symmetric(vertical: 25),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Spacer(),
                              Image.asset(
                                isSocial
                                    ? (Theme.of(context)
                                                .scaffoldBackgroundColor ==
                                            bgColorLight)
                                        ? "assets/sociallight.png"
                                        : "assets/socialdark.png"
                                    : image.toString(),
                                width: MediaQuery.of(context).size.width * 0.8,
                              ),
                              if (isSocial ||
                                  (Theme.of(context).scaffoldBackgroundColor ==
                                      bgColorLight))
                                Text(
                                  "You're all done!",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: textColorLight,
                                    fontFamily: "Product Sans",
                                  ),
                                ),
                              Text(
                                "Nothing in ${homeProvider.drawerOption}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: textColorLight,
                                  fontFamily: "Product Sans",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
