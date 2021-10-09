import 'package:cmail/Providers/mail_provider.dart';
import 'package:page_transition/page_transition.dart';

import '../exports.dart';
import 'dart:math' as math;

class ComposeMail extends StatefulWidget {
  const ComposeMail({Key? key}) : super(key: key);

  @override
  _ComposeMailState createState() => _ComposeMailState();
}

class _ComposeMailState extends State<ComposeMail> {
  // List<String> attachments = [];
  // bool isHTML = false;
  String platformResponse = "";

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController ccController = TextEditingController();
  TextEditingController bccController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  // Future<void> send() async {
  //   final Email email = Email(
  //     body: bodyController.text,
  //     subject: subjectController.text,
  //     recipients: [toController.text],
  //     cc: [ccController.text],
  //     bcc: [bccController.text],
  //     // attachmentPaths: attachments,
  //     // isHTML: isHTML,
  //   );

  //   try {
  //     await FlutterEmailSender.send(email);
  //     print("sent");
  //     platformResponse = 'success';
  //   } catch (error) {
  //     platformResponse = error.toString();
  //     print("error " + error.toString());
  //   }
  // }

  // Future sendEmail() async {
  //   final serviceId = 'service_11bu83h';
  //   final templateId = 'template_9ai5v8q';
  //   final userId = 'user_OjkdOxchKcJ1bcDHBgCEm';
  //   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'origin': 'http://localhost',
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode(
  //       {
  //         'service_id': serviceId,
  //         'template_id': templateId,
  //         'user_id': userId,
  //         'template_params': {
  //           'from_name': fromController.text.split('@')[0],
  //           'from_email': fromController.text,
  //           'to_email': toController.text,
  //           'to_name': toController.text.split('@')[0],
  //           'from_subject': subjectController.text,
  //           'user_message': bodyController.text,
  //           'bcc_email': bccController.text,
  //           'cc_email': ccController.text,
  //         }
  //       },
  //     ),
  //   );
  //   print("response body " + response.body);
  // }

  Future sendEmail() async {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    final email = provider.userEmail;
    final to = toController.text;
    final cc = toController.text;
    final bcc = bccController.text;
    final subject = subjectController.text;
    final body = bodyController.text;
    DateTime now = DateTime.now();
    String fromname = email.split("@")[0];

    MailsModel mail = MailsModel(
      senderName: email.split("@")[0],
      subject: subject,
      desc: body,
      time: (now.hour.toString() + ":" + now.minute.toString()),
      fromMail: email,
      fromName: fromname,
      toMail: "To: $to",
    );

    // final auth = await provider.user.authentication;
    // final accessToken = auth.accessToken!;

    // final smtpServer = gmailSaslXoauth2(email, accessToken);
    // final message = Message()
    //   ..from = Address(email)
    //   ..recipients = [toController.text]
    //   ..subject = subjectController.text
    //   ..text = bodyController.text;

    // try {

    //   // await send(message, smtpServer);
    //   // showSnackBar(text: "Sent email successfully!",color: green);
    // } on MailerException catch (e) {
    //   print("error we got is $e");
    // }
    if (to.isEmpty) {
      showSnackBar(text: "Enter valid To address");
    } else if (subject.isEmpty) {
      showSnackBar(text: "Enter valid subject");
    } else if (body.isEmpty) {
      showSnackBar(text: "Enter valid message");
    } else {
      showSnackBar(text: "Email sent successfully!", color: green);
      provider.sentMail(mail);
      Navigator.of(context).pushReplacement(PageTransition(
        child: HomeScreen(),
        type: PageTransitionType.leftToRight,
      )
          // MaterialPageRoute(
          //   builder: (context) => ,
          // ),
          );
    }
  }

  void showSnackBar({required String text, Color color = darkRed}) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      padding: EdgeInsets.only(left: 10, right: 2, top: 4, bottom: 4),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: color,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        press: sendEmail,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<MailProvider>(
            builder: (context, mailProvider, _) {
              return Column(
                children: [
                  _MailAddressTile(
                    controller: fromController,
                    leadingText: 'From',
                    initialValue: Provider.of<HomeProvider>(context).userEmail,
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
              );
            },
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

  AppBar appBar({required BuildContext context, required VoidCallback press}) {
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
        ActionButtons(tap: press, icon: Icons.send_outlined),
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
