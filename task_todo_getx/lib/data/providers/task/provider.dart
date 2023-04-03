import 'dart:convert';

import 'package:task_todo_getx/core/utils/keys.dart';
import 'package:task_todo_getx/data/services/storage/services.dart';
import 'package:get/get.dart';

import '../../models/task.dart';

class TaskProvider {
  final StorageService _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];

    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) =>tasks.add(Task.formJson(e)));

    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}