import 'package:cmail/Providers/rooms_provider.dart';

import '../exports.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<RoomsProvider>(context, listen: false);
    provider.controller = ScrollController();
    provider.controller.addListener(() {
      provider.setScroll();
    });
  }

  @override
  void dispose() {
    Provider.of<RoomsProvider>(context, listen: false).controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: fab(context, "New room", Icons.add),
      bottomNavigationBar: bottomNav(context),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: drawer(context),
      ),
      body: CustomScrollView(
        controller:
            Provider.of<RoomsProvider>(context, listen: false).controller,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: Appbar.appBar(context),
          ),
        ],
      ),
    );
  }
}
