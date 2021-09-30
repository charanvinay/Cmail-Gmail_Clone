import 'package:cmail/Providers/mail_provider.dart';

import '../exports.dart';
import 'dart:math' as math;

class ComposeMail extends StatelessWidget {
  const ComposeMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MailProvider mailProvider = Provider.of<MailProvider>(context);
    TextEditingController fromController = TextEditingController();
    TextEditingController toController = TextEditingController();
    TextEditingController ccController = TextEditingController();
    TextEditingController bccController = TextEditingController();
    TextEditingController subjectController = TextEditingController();
    TextEditingController bodyController = TextEditingController();
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _MailAddressTile(
                controller: fromController,
                leadingText: 'From',
                initialValue: "test@cmail.com",
              ),
              dividerMethod(context),
              _MailAddressTile(
                controller: toController,
                leadingText: 'To',
                isTo: true,
              ),
              dividerMethod(context),
              if (mailProvider.expanded)
                Column(
                  children: [
                    _MailAddressTile(
                      controller: ccController,
                      leadingText: 'Cc',
                    ),
                    dividerMethod(context),
                    _MailAddressTile(
                        controller: bccController, leadingText: 'Bcc'),
                    dividerMethod(context),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: subjectController,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.headline4!.color,
                      ),
                  minLines: 1,
                  maxLines: null,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "Subject",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
              dividerMethod(context),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: bodyController,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.headline4!.color,
                      ),
                  minLines: 1,
                  maxLines: null,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "Compose email",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dividerMethod(BuildContext context) {
    return Container(
      height: 1,
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      titleSpacing: 0,
      title: Text(
        "Compose",
        style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 22),
      ),
      elevation: 0,
      actions: [
        popupMenuFileMethod(context),
        ActionButtons(icon: Icons.send_outlined),
        popupMenuButtonMethod(context),
      ],
    );
  }

  PopupMenuButton<String> popupMenuButtonMethod(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: Theme.of(context).iconTheme.color),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(child: Text("Schedule send"), value: "Schedule send"),
          PopupMenuItem(
              child: Text("Add from Contacts"), value: "Add from Contacts"),
          PopupMenuItem(
              child: Text("Confidential mode"), value: "Confidential mode"),
          PopupMenuItem(child: Text("Save draft"), value: "Save draft"),
          PopupMenuItem(child: Text("Discard"), value: "Discard"),
          PopupMenuItem(child: Text("Settings"), value: "Settings"),
          PopupMenuItem(
              child: Text("Help & feedback"), value: "Help & feedback"),
        ];
      },
    );
  }

  PopupMenuButton<String> popupMenuFileMethod(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Transform.rotate(
        angle: math.pi / 2,
        child: Icon(Icons.attach_file),
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(child: Text("Attach file"), value: "Attach file"),
          PopupMenuItem(
              child: Text("Insert from drive"), value: "Insert from drive"),
        ];
      },
    );
  }
}

class _MailAddressTile extends StatelessWidget {
  const _MailAddressTile({
    Key? key,
    required this.leadingText,
    required this.controller,
    this.isTo = false,
    this.initialValue,
  }) : super(key: key);

  final String leadingText;
  final String? initialValue;
  final TextEditingController controller;
  final bool? isTo;

  @override
  Widget build(BuildContext context) {
    MailProvider mailProvider =
        Provider.of<MailProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Text(leadingText,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: 16)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: controller,
                cursorColor: Theme.of(context).colorScheme.secondary,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headline4!.color,
                    ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: initialValue,
                  hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.headline4!.color,
                      ),
                ),
              ),
            ),
          ),
          if (isTo!)
            InkWell(
              onTap: () {
                mailProvider.toggleExpanded();
              },
              customBorder: CircleBorder(),
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.keyboard_arrow_down_sharp)),
            )
        ],
      ),
    );
  }
}
