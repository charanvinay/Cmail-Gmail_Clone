import 'package:cmail/Models/chats_model.dart';
import 'package:cmail/Providers/chats_provider.dart';

import '../../exports.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final ChatsModel chat;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final initialLetter = chat.name[0];
    return Consumer<ChatsProvider>(builder: (context, chatsProvider, _) {
      return ListTile(
        onTap: () {},
        title: Text(
          chat.name,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          chat.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: homeProvider.colors[initialLetter.toLowerCase()],
          child: Container(
            child: Text(
              initialLetter,
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).scaffoldBackgroundColor,
                fontFamily: "Product Sans",
              ),
            ),
          ),
        ),
      );
    });
  }
}
