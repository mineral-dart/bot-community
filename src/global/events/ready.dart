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
      "pub.dev/packages/mineral",
      "Flasheberg ❤"
    ];

    int sentence = 0;
    Timer.periodic(Duration(seconds: 45), (timer) {
      sentence = sentence >= status.length ? 1 : sentence + 1;
      client.setPresence(
          status: ClientStatus.online,
          activity: ClientActivity(name: status[sentence - 1], type: GamePresence.watching)
      );
    });
  }
}
