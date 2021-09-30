import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../exports.dart';

class MailBody extends StatelessWidget {
  const MailBody({Key? key, required this.mail, required this.index})
      : super(key: key);
  final MailsModel mail;
  final int index;

  @override
  Widget build(BuildContext context) {
    final initialLetter = mail.senderName[0];

    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // subject with star icon
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              mail.subject,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          ActionButtons(
                            icon:
                                mail.isStarred ? Icons.star : Icons.star_border,
                            color: mail.isStarred ? yellow : textColorLight,
                            tap: () {
                              print("star tapped");
                              homeProvider.setStarred(
                                  homeProvider.currentPageValue.toInt());
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      // mail sender details
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 10,
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor:
                              homeProvider.colors[initialLetter.toLowerCase()],
                          child: Container(
                            child: Text(
                              initialLetter,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "Product Sans",
                              ),
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                mail.senderName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .color,
                                    ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "4 days ago",
                              style: Theme.of(context).textTheme.subtitle2,
                            )
                          ],
                        ),
                        subtitle: Text(
                          "to me",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        trailing: Wrap(
                          children: [
                            ActionButtons(
                                icon: CupertinoIcons.arrow_turn_up_left),
                            popupMenuButtonMethodSender(context),
                          ],
                        ),
                      ),
                      // body
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          mail.desc,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    height: 1.4,
                                    letterSpacing: 0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .color,
                                  ),

                          // TextStyle(
                          //   fontSize: 15,
                          //   height: 1.4,
                          //   color: subjectColorLight,
                          // ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //bottom buttons
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  BottomContainers(
                    icon: CupertinoIcons.arrow_turn_up_left,
                    text: "Reply",
                  ),
                  SizedBox(width: 8),
                  BottomContainers(
                    icon: CupertinoIcons.arrowshape_turn_up_left_2,
                    text: "Reply all",
                  ),
                  SizedBox(width: 8),
                  BottomContainers(
                    icon: CupertinoIcons.arrow_turn_up_right,
                    text: "Forward",
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  PopupMenuButton<String> popupMenuButtonMethodSender(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: Theme.of(context).iconTheme.color),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(child: Text("Reply all"), value: "Reply all"),
          PopupMenuItem(child: Text("Forward"), value: "Forward"),
          PopupMenuItem(child: Text("Add star"), value: "Change labels"),
          PopupMenuItem(child: Text("Print"), value: "Print"),
          PopupMenuItem(
              child: Text("Mark unread from here"),
              value: "Mark unread from here"),
          PopupMenuItem(child: Text("Block"), value: "Block"),
        ];
      },
    );
  }
}
