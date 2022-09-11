import 'package:mineral/core.dart';

import 'events/voice_connect.dart';
import 'events/voice_disconnect.dart';

@Module(identifier: 'voice_module', label: 'Voice module')
class VoiceModule extends MineralModule {
  @override
  Future<void> init() async {
    events.register([VoiceConnect(), VoiceDisconnect()]);
  }
}