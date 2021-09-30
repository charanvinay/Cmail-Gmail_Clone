import 'package:cmail/exports.dart';

class RoomsProvider extends ChangeNotifier {
  bool fabIsVisible = true;
  late ScrollController controller;

  setScroll() {
    fabIsVisible =
        controller.position.userScrollDirection == ScrollDirection.forward;
    notifyListeners();
  }
}
