import '../../exports.dart';

class BottomContainers extends StatelessWidget {
  const BottomContainers({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: textColorLight,
              ),
              SizedBox(width: 5),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Product Sans",
                  color: textColorLight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
