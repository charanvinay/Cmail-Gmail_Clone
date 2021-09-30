import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../exports.dart';

class MailRead extends StatefulWidget {
  const MailRead({
    Key? key,
    required this.mail,
    required this.index,
  }) : super(key: key);

  final MailsModel mail;
  final int index;

  @override
  _MailReadState createState() => _MailReadState();
}

class _MailReadState extends State<MailRead> {
  late PageController controller;
  double currentPageValue = 0.0;

  @override
  void initState() {
    controller = PageController(initialPage: widget.index);
    Provider.of<HomeProvider>(context, listen: false).currentPageValue =
        widget.index.toDouble();
    controller.addListener(() {
      Provider.of<HomeProvider>(context, listen: false)
          .setCurrentPage(controller: controller);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ActionButtons(icon: Icons.archive_outlined),
          ActionButtons(icon: Icons.delete_outline),
          ActionButtons(icon: Icons.mail_outline_rounded),
          popupMenuButtonMethod(),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, _) {
          return Container(
            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: controller,
              itemCount: homeProvider.mailsList.length,
              itemBuilder: (context, postition) {
                return MailBody(
                  mail: homeProvider.mailsList[postition],
                  index: widget.index,
                );
              },
            ),
          );
        },
      ),
    );
  }

  PopupMenuButton<String> popupMenuButtonMethod() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: Theme.of(context).iconTheme.color),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: Text("Move To"),
            value: "Move To",
          ),
          PopupMenuItem(
            child: Text("Snooze"),
            value: "Snooze",
          ),
          PopupMenuItem(
            child: Text("Change labels"),
            value: "Change labels",
          ),
          PopupMenuItem(
            child: Text("Mark not important"),
            value: "Mark not important",
          ),
          PopupMenuItem(
            child: Text("Mute"),
            value: "Mute",
          ),
          PopupMenuItem(
            child: Text("View in light theme"),
            value: "View in light theme",
          ),
          PopupMenuItem(
            child: Text("Print"),
            value: "Print",
          ),
          PopupMenuItem(
            child: Text("Report spam"),
            value: "Report spam",
          ),
          PopupMenuItem(
            child: Text("Add to Tasks"),
            value: "Add to Tasks",
          ),
          PopupMenuItem(
            child: Text("Help & feedback"),
            value: "Help & feedback",
          ),
        ];
      },
    );
  }
}
