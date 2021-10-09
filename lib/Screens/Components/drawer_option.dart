import 'package:cmail/Models/drawer_model.dart';
import 'package:cmail/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerOption extends StatelessWidget {
  const DrawerOption({
    Key? key,
    required this.drawerOption,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  final DrawerModel drawerOption;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    final String starredCount =
        Provider.of<HomeProvider>(context).starredMails.length.toString();
    final String sentCount =
        Provider.of<HomeProvider>(context).sentMails.length.toString();
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ListTile(
        horizontalTitleGap: 5,
        selected: true,
        dense: true,
        title: Text(
          drawerOption.name,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontFamily: "Product Sans",
                color: isSelected
                    ? (drawerOption.name == "Primary" ||
                            drawerOption.name == "Social" ||
                            drawerOption.name == "Promotions")
                        ? drawerOption.color!.withOpacity(0.8)
                        : Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.secondary,
              ),
        ),
        leading: Icon(
          drawerOption.icon,
          color: isSelected
              ? (drawerOption.name == "Primary" ||
                      drawerOption.name == "Social" ||
                      drawerOption.name == "Promotions")
                  ? drawerOption.color!.withOpacity(0.8)
                  : Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.secondary,
        ),
        trailing:
            (drawerOption.name == "Social" || drawerOption.name == "Promotions")
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: drawerOption.color,
                    ),
                    child: Text(
                      "${drawerOption.count} new",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Product Sans",
                      ),
                    ),
                  )
                : Text(
                    drawerOption.name == "Starred"
                        ? starredCount == "0"
                            ? ""
                            : starredCount
                        : drawerOption.name == "Sent"
                            ? sentCount == "0"
                                ? ""
                                : sentCount
                            : drawerOption.count,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Product Sans",
                      color: isSelected
                          ? (drawerOption.name == "Primary" ||
                                  drawerOption.name == "Social" ||
                                  drawerOption.name == "Promotions")
                              ? drawerOption.color
                              : Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.secondary,
                    ),
                  ),
        selectedTileColor: isSelected
            ? (drawerOption.name == "Primary" ||
                    drawerOption.name == "Social" ||
                    drawerOption.name == "Promotions")
                ? drawerOption.color!.withOpacity(0.10)
                : Theme.of(context).accentColor.withOpacity(0.5)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        onTap: onSelect,
      ),
    );
  }
}
