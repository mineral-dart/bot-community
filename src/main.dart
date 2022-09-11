import 'package:mineral/core.dart';

import 'global/global_module.dart';
import 'voice_module/voice_module.dart';

void main () async {
  Kernel kernel = Kernel()
    ..intents.defined(all: true)
    ..commands.register([])
    ..events.register([])
    ..modules.register([GlobalModule(), VoiceModule()])
    ..contextMenus.register([]);

  await kernel.init();
}
