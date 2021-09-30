import '../exports.dart';

class MailsScreen extends StatefulWidget {
  const MailsScreen({Key? key}) : super(key: key);

  @override
  _MailsScreenState createState() => _MailsScreenState();
}

class _MailsScreenState extends State<MailsScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.controller = ScrollController();
    provider.controller.addListener(() {
      provider.setScroll();
    });
  }

  @override
  void dispose() {
    Provider.of<HomeProvider>(context, listen: false).controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext homeContext) {
    return Scaffold(
      floatingActionButton: fab(context, "Compose", Icons.edit_outlined),
      bottomNavigationBar: bottomNav(context),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: drawer(context),
      ),
      body: CustomScrollView(
        controller:
            Provider.of<HomeProvider>(context, listen: false).controller,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: Appbar.appBar(homeContext),
          ),
          SliverToBoxAdapter(
            child: Consumer<HomeProvider>(
              builder: (context, homeProvider, _) {
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
                                );
                              },
                            )
                          ],
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height - 200,
                        margin: EdgeInsets.symmetric(vertical: 25),
                        child: Center(
                          child: Text(
                            "Nothing in ${homeProvider.drawerOption}",
                            style: TextStyle(
                              fontSize: 20,
                              color: textColorLight,
                              fontFamily: "Product Sans",
                            ),
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
