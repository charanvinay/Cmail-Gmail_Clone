import '../../exports.dart';

class Appbar {
  static SliverAppBar appBar(BuildContext context) {
    final searchintext = Provider.of<HomeProvider>(context).searchInText;
    return SliverAppBar(
      toolbarHeight: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 1.4,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      titleSpacing: 0,
      title: Text(
        "Search in $searchintext",
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/charan.jpg"),
            ),
            border: Border.all(
              width: 1.0,
              color: appbarBorderLight,
            ),
          ),
        ),
      ],
      floating: true,
    );
  }
}
