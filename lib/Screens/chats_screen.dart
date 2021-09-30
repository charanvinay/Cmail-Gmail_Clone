import 'package:cmail/Models/chats_model.dart';
import 'package:cmail/Providers/chats_provider.dart';
import 'package:cmail/Screens/Components/chats_tile.dart';

import '../exports.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
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
  Widget build(BuildContext chatsContext) {
    return Scaffold(
      floatingActionButton:
          fab(context, "New chat", Icons.chat_bubble_outline_outlined),
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
                            "Nothing in chats}",
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
