import 'package:mineral/framework.dart';

import 'events/voice_connect.dart';
import 'events/voice_disconnect.dart';

class VoiceModule extends MineralModule {
  VoiceModule (): super('voice_module', 'Voice module', 'description');

  @override
  Future<void> init() async {
    commands.register([]);
    events.register([VoiceConnect(), VoiceDisconnect()]);
    contextMenus.register([]);
    states.register([]);
  }
}