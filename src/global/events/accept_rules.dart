import 'package:mineral/core/api.dart';
import 'package:mineral/core/events.dart';
import 'package:mineral/framework.dart';
import 'package:mineral/core/extras.dart';

class AcceptRules extends MineralEvent<AcceptRulesEvent> with MineralContext {

  Future<void> handle (AcceptRulesEvent event) async {
    final Snowflake? roleId = environment.get('BASE_MEMBER_ROLE');
    if (roleId != null) {
      return;
    }

    await event.member.roles.add(roleId!);
  }
}
