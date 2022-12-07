import 'package:mineral/core/events.dart';
import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';

class VoiceDisconnect extends MineralEvent<VoiceLeaveEvent> with MineralContext {
  Future<void> handle (VoiceLeaveEvent event) async {
    final String categoryId = environment.get('VOICE_CATEGORY')!;
    if(event.channel.parent?.id != categoryId || event.channel.id == environment.get('VOICE_CHANNEL')) return;

    if(event.channel.members.length <= 0) await event.channel.delete();
  }
}
