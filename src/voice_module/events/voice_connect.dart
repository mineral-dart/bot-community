import 'package:mineral/core/api.dart';
import 'package:mineral/core/builders.dart';
import 'package:mineral/core/events.dart';
import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';

class VoiceConnect extends MineralEvent<VoiceJoinEvent> with MineralContext {

  Future<void> handle (VoiceJoinEvent event) async {
    if (event.after.id != environment.get('VOICE_CHANNEL')) return;
    final String categoryId = environment.get('VOICE_CATEGORY')!;

    final Guild guild = event.member.guild;

    final VoiceChannel? channel = await guild.channels.create(ChannelBuilder.fromVoiceChannel(
      label: 'Salon de ${event.member.nickname}',
      parentId: categoryId,
      permissions: [PermissionOverwrite(id: event.member.id, type: PermissionOverwriteType.member, allow: [Permission.manageChannels], deny: [])]
    ));

    if(channel == null) return event.member.voice.disconnect();
    await event.member.voice.move(channel.id);
  }
}
