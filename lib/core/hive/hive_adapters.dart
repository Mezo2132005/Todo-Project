import 'package:hive_ce/hive_ce.dart';
import 'package:todo_project/models/task_model.dart';
import 'package:todo_project/models/user_data.dart';

@GenerateAdapters([
  AdapterSpec<TaskModel>(),
  AdapterSpec<UserData>(),
])
part 'hive_adapters.g.dart';