import 'package:mineral/core/api.dart';
import 'package:mineral/core/builders.dart';
import 'package:mineral/framework.dart';
import 'package:mineral/src/internal/entities/command.dart';

class RoleCommand extends MineralCommand {
  RoleCommand () {
    final sub1 = SubCommandBuilder('add', 'a', add)
      ..addOption(Option(name: 'user', description: 'a', type: OptionType.user, required: true))
      ..addOption(Option(name: 'role', description: 'a', type: OptionType.role, required: true));

    final sub2 = SubCommandBuilder('remove', '', remove)
      ..addOption(Option(name: 'user', description: 'a', type: OptionType.user, required: true))
      ..addOption(Option(name: 'role', description: 'a', type: OptionType.role, required: true));

    final sub3 = SubCommandBuilder('toggle', 'a', toggle)
      ..addOption(Option(name: 'user', description: 'a', type: OptionType.user, required: true))
      ..addOption(Option(name: 'role', description: 'a', type: OptionType.role, required: true));

    final command = CommandBuilder('role', 'Panda veut faire du dart', scope: Scope.guild)
      ..addSubcommand(sub1)
      ..addSubcommand(sub2)
      ..addSubcommand(sub3);

    register(command);
  }

  Future<void> add (CommandInteraction interaction) async {
    final GuildMember? member = interaction.getMember('user');
    final Role? role = interaction.getRole('role');
    if (member == null || role == null) return;

    await member.roles.add(role.id, reason: interaction.user.username);

    final EmbedBuilder embed = EmbedBuilder(
        description: 'Le rôle $role a été ajouté pour $member !',
        color: Color.green_600
    );
    await interaction.reply(embeds: [embed], private: true);
  }

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
  