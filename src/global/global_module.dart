import 'package:mineral/core.dart';

import 'events/accept_rules.dart';
import 'events/ready.dart';
import 'role_command.dart';

@Module(identifier: 'global_module', label: 'Global module')
class GlobalModule extends MineralModule {
  @override
  Future<void> init() async {
    events.register([AcceptRules(), Ready()]);
    commands.register([RoleCommand()]);
  }
}