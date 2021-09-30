import 'package:cmail/exports.dart';

class MailProvider extends ChangeNotifier {
  bool expanded = false;

  toggleExpanded() {
    expanded = !expanded;
    notifyListeners();
  }
}
