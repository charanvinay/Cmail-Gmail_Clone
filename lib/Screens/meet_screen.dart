import '../exports.dart';

class MeetScreen extends StatelessWidget {
  const MeetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(context),
    );
  }
}
