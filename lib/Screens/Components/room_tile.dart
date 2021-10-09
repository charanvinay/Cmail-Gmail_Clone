import 'package:cmail/Models/rooms_model.dart';
import 'package:cmail/Providers/rooms_provider.dart';

import '../../exports.dart';

class RoomTile extends StatelessWidget {
  const RoomTile({Key? key, required this.room}) : super(key: key);
  final RoomsModel room;

  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final initialLetter = room.name[0];
    return Consumer<RoomsProvider>(
      builder: (context, roomsProvider, _) {
        return ListTile(
          onTap: () {},
          title: Text(
            room.name,
            style: Theme.of(context).textTheme.headline5,
          ),
          leading: Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: homeProvider.colors[initialLetter.toLowerCase()]!
                  .withOpacity(0.2),
            ),
            child: Center(
              child: Text(
                initialLetter,
                style: TextStyle(
                  fontSize: 20,
                  color: homeProvider.colors[initialLetter.toLowerCase()],
                  fontFamily: "Product Sans",
                ),
              ),
            ),
          ),
          trailing: Text(
            room.date,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        );
      },
    );
  }
}
