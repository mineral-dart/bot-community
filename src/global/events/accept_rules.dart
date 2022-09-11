import 'package:mineral/api.dart';
import 'package:mineral/core.dart';

@Event(Events.acceptRules)
class AcceptRules extends MineralEvent {
  Future<void> handle (GuildMember member) async {
    final Environment environment = ioc.singleton(ioc.services.environment);
    final Snowflake? roleId = environment.get('BASE_MEMBER_ROLE');
    if(roleId == null) return;

    await member.roles.add(roleId);
  }
}
    