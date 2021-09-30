import '../../exports.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
    required this.icon,
    this.color = iconsColorLight,
    this.tap,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final VoidCallback? tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: tap,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Icon(
          icon,
          color: color != iconsColorLight
              ? color
              : Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
