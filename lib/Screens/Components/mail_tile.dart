import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../../exports.dart';

class MailTile extends StatelessWidget {
  const MailTile({
    Key? key,
    required this.mail,
    required this.index,
    this.isSent = false,
  }) : super(key: key);

  final MailsModel mail;
  final int index;
  final bool isSent;

  @override
  Widget build(BuildContext context) {
    final initialLetter = mail.senderName![0];

    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          background: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: green,
            ),
            child: Row(
              children: [
                Spacer(),
                Lottie.network(
                  'https://maxst.icons8.com/vue-static/landings/animated-icons/icons/installing-updates/installing-updates.json',
                  repeat: true,
                  width: 30,
                  height: 30,
                  animate: true,
                ),
              ],
            ),
          ),
          onDismissed: (direction) {
            final snackBar = SnackBar(
              action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  homeProvider.archievedMails.remove(mail);
                  homeProvider.removeMail(mail);
                },
              ),
              padding: EdgeInsets.only(left: 10, right: 2, top: 4, bottom: 4),
              content: Text('1 archieved'),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            homeProvider.archieveMail(mail);
          },
          child: Stack(
            children: [
              ListTile(
                onTap: () {
                  print(mail.senderName);
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: MailRead(mail: mail, index: index),
                    ),
                  );
                },
                leading: CircleAvatar(
                  radius: 22,
                  backgroundColor:
                      homeProvider.colors[initialLetter.toLowerCase()],
                  child: Container(
                    child: Text(
                      initialLetter.toUpperCase(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontFamily: "Product Sans",
                      ),
                    ),
                  ),
                ),
                title: Text(
                  isSent ? mail.toMail : mail.fromName,
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      mail.subject,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 4),
                    Text(
                      mail.desc,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mail.time,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    homeProvider.setStarred(
                      homeProvider.mailsList.indexOf(mail),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      mail.isStarred ? Icons.star : Icons.star_border_outlined,
                      color: mail.isStarred ? yellow : textColorLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
