import 'package:cmail/Api/google_signin_api.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exports.dart';

class HomeProvider extends ChangeNotifier {
  bool isSelected = false;
  // bool fabIsVisible = true;

  int currentSelectedIndex = 1;
  int currentScreen = 0;
  int removeMailIndex = -1;
  double currentPageValue = -1.0;

  String drawerOption = "Primary";
  String searchInText = "mail";

  String userEmail = "";
  String? userId = "";
  String userPhotoUrl = "";
  String userDisplayName = "";

  // late ScrollController controller;

  List<MailsModel> starredMails = [];
  List<MailsModel> archievedMails = [];
  List<MailsModel> sentMails = [];
  List<MailsModel> mailsList = mails!;

  // late GoogleSignInAccount user;
  // late GoogleSignInAccount newUser;

  var colors = {
    "a": Color(0xffF5BF26),
    "b": Color(0xffB56470),
    "c": Color(0xff4FC2F8),
    "d": Color(0xffEF8228),
    "e": Color(0xffDE4439),
    "f": Color(0xff53C638),
    "g": Color(0xffE3492A),
    "h": Color(0xffFF8A66),
    "i": Color(0xffF1A13A),
    "j": Color(0xff3AB441),
    "k": Color(0xffE86100),
    "l": Color(0xffF1442D),
    "m": Color(0xffBC4B69),
    "n": Color(0xff3D860B),
    "o": Color(0xff543863),
    "p": Color(0xff89B4F8),
    "q": Color(0xff4F0C87),
    "r": Color(0xff6B8CA6),
    "s": Color(0xffF1A13A),
    "t": Color(0xff9CCC66),
    "u": Color(0xff9029AB),
    "v": Color(0xffC739AB),
    "w": Color(0xffD4270E),
    "x": Color(0xffCAA87D),
    "y": Color(0xff1A94D0),
    "z": Color(0xff53C638),
  };

  List<String> meetImages = ["assets/meet1.png", "assets/meet2.png"];
  List<String> meetTitle = ["Get a link you can share", "Your meeting is safe"];
  List<String> meetDesc = [
    "Tap New meeting to get a link you can send to people you want to meet with",
    "No one outside your organisation can join a meeting unless invited ot admitted by the host"
  ];

  var images = {
    "Social": ["assets/sociallight.png", "assets/socialdark.png"],
    "Promotions": ["assets/sociallight.png", "assets/socialdark.png"],
    "Starred": "assets/starred.png",
    "Snoozed": "assets/snoozed.png",
    "Important": "assets/scheduled.png",
    "Sent": "assets/scheduled.png",
    "Scheduled": "assets/scheduled.png",
    "Outbox": "assets/scheduled.png",
    "Drafts": "assets/drafts.png",
    "Archieved": "assets/scheduled.png",
    "Spam": "assets/spam.png",
    "Trash": "assets/trash.png",
    "Calendar": ["assets/sociallight.png", "assets/socialdark.png"],
    "Contacts": ["assets/sociallight.png", "assets/socialdark.png"],
    "Settings": ["assets/sociallight.png", "assets/socialdark.png"],
    "Help & feedback": ["assets/sociallight.png", "assets/socialdark.png"],
  };

  final screens = [
    MailsScreen(),
    ChatsScreen(),
    RoomsScreen(),
    MeetScreen(),
  ];

  setStarred(int index) {
    mailsList[index].isStarred = !mailsList[index].isStarred;
    if (mailsList[index].isStarred) {
      starredMails.add(mailsList[index]);
    } else if (!mailsList[index].isStarred) {
      starredMails.remove(mailsList[index]);
    }
    notifyListeners();
  }

  // initStarred() {
  //   for (int i = 0; i < mails!.length; i++) {
  //     if (mailsList[i].isStarred) {
  //       starredMails.add(mails![i]);
  //     }
  //   }
  // }

  isSelectedIndex({required int index}) {
    notifyListeners();
    return currentSelectedIndex == index;
  }

  setSelectedIndex({required int index}) {
    drawerOption = drawerOptions[index].name;
    currentSelectedIndex = index;
    notifyListeners();
  }

  setDrawerOption() {
    drawerOption = "Primary";
    currentSelectedIndex = 1;
    notifyListeners();
  }

  setCurrentPage({required PageController controller, int? index}) {
    currentPageValue = controller.page!;
    notifyListeners();
  }

  Widget getWidget({required BuildContext context}) {
    if (drawerOption == "Primary" || drawerOption == "All inboxes") {
      mailsList = mails!;
      return MailsScreen();
    } else if (drawerOption == "Starred") {
      mailsList = starredMails;
      return MailsScreen();
    } else if (drawerOption == "Archieved") {
      mailsList = archievedMails;
      return MailsScreen();
    } else if (drawerOption == "Sent") {
      mailsList = sentMails;
      return MailsScreen(isSent: true);
    } else if (drawerOption == "Settings") {
      return SettingsScreen();
    }
    mailsList = [];
    return MailsScreen();
  }

  // setScroll() {
  //   fabIsVisible =
  //       controller.position.userScrollDirection == ScrollDirection.forward;
  //   notifyListeners();
  // }

  archieveMail(MailsModel mail) {
    removeMailIndex = mailsList.indexOf(mail);
    mailsList.remove(mail);
    archievedMails.add(mail);
    notifyListeners();
  }

  sentMail(MailsModel mail) {
    sentMails.add(mail);
    notifyListeners();
  }

  removeMail(MailsModel mail) {
    mailsList.insert(removeMailIndex, mail);
    notifyListeners();
  }

  setCurrentScreen(int index) {
    currentScreen = index;
    if (index == 0)
      searchInText = "mail";
    else if (index == 1)
      searchInText = "chat";
    else if (index == 2) searchInText = "rooms";
    notifyListeners();
  }

  setUserAccount(BuildContext context, GoogleSignInAccount user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("user_email", user.email);
    await pref.setString("user_id", user.id);
    await pref.setString("user_photoUrl", user.photoUrl ?? "");
    await pref.setString("user_displayname", user.displayName ?? "");
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => HomeScreen(),
    //   ),
    // );
    notifyListeners();
  }

  Future signIn(BuildContext context) async {
    GoogleSignInApi.loginOut();
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sign in Failed"),
          padding: EdgeInsets.only(left: 10, right: 2, top: 4, bottom: 4),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    } else {
      setUserAccount(context, user);
    }
    notifyListeners();
  }
}
