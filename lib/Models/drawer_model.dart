import '../exports.dart';

class DrawerModel {
  IconData icon;
  String name;
  String count;
  Color? color;

  DrawerModel({
    required this.icon,
    required this.name,
    this.count = "",
    this.color,
  });
}

List<DrawerModel> drawerOptions = [
  DrawerModel(icon: Icons.all_inbox, name: "All inboxes"),
  DrawerModel(
    icon: Icons.inbox,
    name: "Primary",
    color: Colors.red[500],
    count: "21",
  ),
  DrawerModel(
    icon: Icons.people_alt_outlined,
    name: "Social",
    color: blue,
    count: "3",
  ),
  DrawerModel(
    icon: Icons.local_offer_outlined,
    name: "Promotions",
    color: green,
    count: "2",
  ),
  DrawerModel(icon: Icons.star_border, name: "Starred"),
  DrawerModel(icon: Icons.access_time, name: "Snoozed"),
  DrawerModel(
      icon: Icons.label_important_outline, name: "Important", count: "69"),
  DrawerModel(icon: Icons.send_outlined, name: "Sent"),
  DrawerModel(icon: Icons.schedule_send_outlined, name: "Scheduled"),
  DrawerModel(icon: Icons.outbox_outlined, name: "Outbox"),
  DrawerModel(icon: Icons.insert_drive_file_outlined, name: "Drafts"),
  DrawerModel(icon: Icons.mail_outline, name: "Archieved"),
  DrawerModel(icon: Icons.report_gmailerrorred_outlined, name: "Spam"),
  DrawerModel(icon: Icons.delete_outline, name: "Trash"),
  DrawerModel(icon: Icons.calendar_today, name: "Calendar"),
  DrawerModel(icon: Icons.account_circle_outlined, name: "Contacts"),
  DrawerModel(icon: Icons.settings_outlined, name: "Settings"),
  DrawerModel(icon: Icons.help_outline_outlined, name: "Help & feedback"),
];
