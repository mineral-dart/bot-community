import 'package:mineral/api.dart';
import 'package:mineral/core.dart';

@Event(Events.voiceConnect, customId: '1018150017938227212')
class VoiceConnect extends MineralEvent {
  Future<void> handle (GuildMember member, VoiceChannel? before, VoiceChannel after) async {
    final Environment environment = ioc.singleton(ioc.services.environment);
    final String categoryId = environment.get('VOICE_CATEGORY')!;

    final Guild guild = member.guild;

    final VoiceChannel? channel = await guild.channels.create(ChannelBuilder.fromVoiceChannel(
      label: 'Salon de ${member.nickname}',
      parentId: categoryId,
      permissions: [PermissionOverwrite(id: member.id, type: PermissionOverwriteType.member, allow: [Permission.manageChannels], deny: [])]
    ));

    if(channel == null) return member.voice.disconnect();
    member.voice.move(channel.id);
  }
}
    