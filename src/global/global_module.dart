import 'package:mineral/framework.dart';
import 'events/accept_rules.dart';
import 'events/ready.dart';
import 'role_command.dart';

class GlobalModule extends MineralModule {
  GlobalModule (): super('global_module', 'Global module', 'description');

  @override
  Future<void> init() async {
    commands.register([RoleCommand()]);
    events.register([AcceptRules(), Ready()]);
    contextMenus.register([]);
    states.register([]);
  }
}