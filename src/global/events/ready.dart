import 'dart:async';

import 'package:mineral/api.dart';
import 'package:mineral/console.dart';
import 'package:mineral/core.dart';

@Event(Events.ready)
class Ready extends MineralEvent {
  Future<void> handle (MineralClient client) async {
    Console.success(message: "Bot started!");

    List<String> status = [
      "github.com/mineral-dart",
      "pub.dev/packages/mineral"
    ];

    bool sentence = false;
    Timer.periodic(Duration(seconds: 45), (timer) {
      sentence = !sentence;
      client.setPresence(
        status: ClientStatus.online,
        activity: ClientActivity(name: sentence ? status[0] : status[1], type: GamePresence.watching)
      );
    });
  }
}
    