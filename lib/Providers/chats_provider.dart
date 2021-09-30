import 'package:cmail/Models/chats_model.dart';
import 'package:cmail/exports.dart';

class ChatsProvider extends ChangeNotifier {
  // bool fabIsVisible = true;
  // late ScrollController controller;

  List<ChatsModel> chatsList = chats;

  // setScroll() {
  //   fabIsVisible =
  //       controller.position.userScrollDirection == ScrollDirection.forward;
  //   notifyListeners();
  // }
}
