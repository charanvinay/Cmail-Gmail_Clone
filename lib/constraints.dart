import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'exports.dart';

Consumer bottomNav(BuildContext context) {
  return Consumer<HomeProvider>(
    builder: (context, homeProvider, _) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: Provider.of<HomeProvider>(context).fabIsVisible
            ? kBottomNavigationBarHeight
            : 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: homeProvider.currentScreen,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            homeProvider.setCurrentScreen(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline_outlined),
              label: "",
              activeIcon: Icon(Icons.mail),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: "",
              activeIcon: Icon(Icons.chat_bubble),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined),
              label: "",
              activeIcon: Icon(Icons.groups),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam_outlined),
              label: "",
              activeIcon: Icon(Icons.videocam),
            ),
          ],
        ),
      );
    },
  );
}

FloatingActionButton fab(BuildContext context, String text, IconData icon) {
  return FloatingActionButton.extended(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ComposeMail(),
        ),
      );
    },
    isExtended: Provider.of<HomeProvider>(context).fabIsVisible,
    label: Provider.of<HomeProvider>(context).fabIsVisible
        ? Text(
            text,
            style: Theme.of(context).textTheme.button,
          )
        : Container(),
    icon: Icon(
      icon,
      color: Theme.of(context).colorScheme.error,
      size: 20,
    ),
  );
}

Drawer drawer(BuildContext context) {
  return Drawer(
    child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Cmail',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Divider(),
          Consumer<HomeProvider>(
            builder: (context, homeProvider, _) {
              return ListView.builder(
                itemCount: drawerOptions.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DrawerOption(
                        isSelected: homeProvider.currentSelectedIndex == index,
                        drawerOption: drawerOptions[index],
                        onSelect: () {
                          homeProvider.setSelectedIndex(index: index);
                          Navigator.pop(context);
                        },
                      ),
                      if (drawerOptions[index].name == "All inboxes") Divider(),
                      if (drawerOptions[index].name == "Promotions")
                        HeadingText(text: "all labels", fontSize: 10),
                      if (drawerOptions[index].name == "Trash")
                        HeadingText(text: "google apps", fontSize: 10),
                      if (drawerOptions[index].name == "Contacts") Divider(),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    ),
  );
}
