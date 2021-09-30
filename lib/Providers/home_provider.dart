import '../exports.dart';

class HomeProvider extends ChangeNotifier {
  bool isSelected = false;
  bool fabIsVisible = true;

  int currentSelectedIndex = 1;
  int currentScreen = 0;
  int removeMailIndex = -1;
  double currentPageValue = -1.0;

  String drawerOption = "Primary";
  String searchInText = "mail";

  late ScrollController controller;

  List<MailsModel> starredMails = [];
  List<MailsModel> archievedMails = [];
  List<MailsModel> mailsList = mails;

  var colors = {
    "a": Color(0xffF5BF26),
    "b": Color(0xffB56470),
    "c": Color(0xff4FC2F8),
    "d": Color(0xffEF8228),
    "e": Color(0xffDE4439),
    "f": Color(0xff8E1710),
    "g": Color(0xffE3492A),
    "h": Color(0xffFF8A66),
    "i": Color(0xffF1A13A),
    "j": Color(0xff3AB441),
    "k": Color(0xffE86100),
    "l": Color(0xffF1442D),
    "m": Color(0xffBC4B69),
    "n": Color(0xff3D860B),
    "o": Color(0xff543863),
    "p": Color(0xff1E6CD5),
    "q": Color(0xff4F0C87),
    "r": Color(0xff6B8CA6),
    "s": Color(0xff4F0C87),
    "t": Color(0xff9CCC66),
    "u": Color(0xffC739AB),
    "v": Color(0xff9029AB),
    "w": Color(0xffD4270E),
    "x": Color(0xffCAA87D),
    "y": Color(0xff1A94D0),
    "z": Color(0xff53C638),
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

  initStarred() {
    for (int i = 0; i < mails.length; i++) {
      if (mailsList[i].isStarred) {
        starredMails.add(mails[i]);
      }
    }
  }

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
    if (drawerOption == "Primary") {
      mailsList = mails;
      return MailsScreen();
    } else if (drawerOption == "Starred") {
      mailsList = starredMails;
      return MailsScreen();
    } else if (drawerOption == "Archieved") {
      mailsList = archievedMails;
      return MailsScreen();
    } else if (drawerOption == "Settings") {
      return SettingsScreen();
    }
    mailsList = [];
    return MailsScreen();
  }

  setScroll() {
    fabIsVisible =
        controller.position.userScrollDirection == ScrollDirection.forward;
    notifyListeners();
  }

  archieveMail(MailsModel mail) {
    removeMailIndex = mailsList.indexOf(mail);
    mailsList.remove(mail);
    archievedMails.add(mail);
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
}
