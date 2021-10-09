import 'package:cmail/Providers/chats_provider.dart';
import 'package:cmail/Screens/Components/chats_tile.dart';

import '../exports.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late ScrollController chatController;
  bool isFabVisible = true;
  @override
  void initState() {
    chatController = ScrollController();
    chatController.addListener(() {
      setState(() {
        isFabVisible = chatController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
    super.initState();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   final provider = Provider.of<HomeProvider>(context, listen: false);
  //   provider.controller = ScrollController();
  //   provider.controller.addListener(() {
  //     provider.setScroll();
  //   });
  // }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext chatsContext) {
    return Scaffold(
      floatingActionButton: fab(
        context,
        "New chat",
        Icons.chat_bubble_outline_outlined,
        () {
          print("chat tap disabled");
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
        controller: chatController,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: Appbar.appBar(chatsContext),
          ),
          SliverToBoxAdapter(
            child: Consumer<ChatsProvider>(
              builder: (context, chatsProvider, _) {
                return chatsProvider.chatsList.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // primary text
                            HeadingText(text: "chats"),
                            ListView.builder(
                              itemCount: chatsProvider.chatsList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ChatTile(
                                    chat: chatsProvider.chatsList[index]);
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
                            "Nothing in chats",
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
