import 'package:mineral/api.dart';
import 'package:mineral/core.dart';

@Command(name: 'role', description: 'Panda veut faire du dart', scope: 'GUILD', everyone: false)
class RoleCommand extends MineralCommand {
  @Subcommand(name: 'add', description: 'Ajouter un rôle')
  @Option(name: 'user', description: 'Utilisateur auquel ajouter un rôle', type: OptionType.user, required: true)
  @Option(name: 'role', description: 'Rôle à ajouter', type: OptionType.role, required: true)
  Future<void> add (CommandInteraction interaction) async {
    final GuildMember? member = interaction.getMember('user');
    final Role? role = interaction.getRole('role');
    if(member == null || role == null) return;

    await member.roles.add(role.id, reason: interaction.user.username);

    final EmbedBuilder embed = EmbedBuilder(
      description: 'Le rôle $role a été ajouté pour $member !',
      color: Color.green_600
    );
    await interaction.reply(embeds: [embed], private: true);
  }

  @Subcommand(name: 'remove', description: 'Retirer un rôle')
  @Option(name: 'user', description: 'Utilisateur auquel retirer un rôle', type: OptionType.user, required: true)
  @Option(name: 'role', description: 'Rôle à retirer', type: OptionType.role, required: true)
  Future<void> remove (CommandInteraction interaction) async {
    final GuildMember? member = interaction.getMember('user');
    final Role? role = interaction.getRole('role');
    if(member == null || role == null) return;

    await member.roles.remove(role.id, reason: interaction.user.username);

    final EmbedBuilder embed = EmbedBuilder(
        description: 'Le rôle $role a été retiré pour $member !',
        color: Color.red_400
    );
    await interaction.reply(embeds: [embed], private: true);
  }

  @Subcommand(name: 'toggle', description: 'Switch un rôle')
  @Option(name: 'user', description: 'Utilisateur auquel switch un rôle', type: OptionType.user, required: true)
  @Option(name: 'role', description: 'Rôle à switch', type: OptionType.role, required: true)
  Future<void> toggle (CommandInteraction interaction) async {
    final GuildMember? member = interaction.getMember('user');
    final Role? role = interaction.getRole('role');
    if(member == null || role == null) return;

    await member.roles.toggle(role.id, reason: interaction.user.username);

    final EmbedBuilder embed = EmbedBuilder(
        description: 'Le rôle $role a été switch pour $member !',
        color: Color.red_400
    );
    await interaction.reply(embeds: [embed], private: true);
  }
}
  