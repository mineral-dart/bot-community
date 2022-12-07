import 'dart:async';

import 'package:mineral/core/api.dart';
import 'package:mineral/core/events.dart';
import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';

class Ready extends MineralEvent<ReadyEvent> with MineralContext {
  Future<void> handle (ReadyEvent event) async {
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
