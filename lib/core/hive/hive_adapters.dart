import 'package:hive_ce/hive_ce.dart';

import '../../models/todo.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<Todo>(),
])
class HiveAdapters {}