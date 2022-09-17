import 'package:mineral/api.dart';
import 'package:mineral/core.dart';

@Event(Events.voiceDisconnect)
class VoiceDisconnect extends MineralEvent {
  Future<void> handle (GuildMember member, VoiceChannel before) async {
    final String categoryId = environment.get('VOICE_CATEGORY')!;
    if(before.parent?.id != categoryId || before.id == environment.get('VOICE_CHANNEL')) return;

    if(before.members.length <= 0) await before.delete();
  }
}
