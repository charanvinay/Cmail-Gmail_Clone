import 'package:cmail/Providers/rooms_provider.dart';
import 'package:cmail/Screens/Components/room_tile.dart';

import '../exports.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController roomController;
  bool isFabVisible = true;
  @override
  void initState() {
    roomController = ScrollController();
    roomController.addListener(() {
      setState(() {
        isFabVisible = roomController.position.userScrollDirection ==
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
    roomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: fab(
        context,
        "New room",
        Icons.add,
        () {
          print("rooms tap disabled");
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
        controller: roomController,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: Appbar.appBar(context),
          ),
          SliverToBoxAdapter(
            child: Consumer<RoomsProvider>(
              builder: (context, roomsProvider, _) {
                return roomsProvider.roomsList.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // primary text
                            HeadingText(text: "rooms"),
                            ListView.builder(
                              itemCount: roomsProvider.roomsList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                return RoomTile(
                                  room: roomsProvider.roomsList[index],
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
                            "Nothing in rooms",
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
