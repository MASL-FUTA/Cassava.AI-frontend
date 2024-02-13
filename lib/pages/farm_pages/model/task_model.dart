import 'dart:developer';

import 'package:masl_futa_agric/enums/farm_task_status.dart';

class TaskModel {
  String title = '';
  String priority = '';
  String deadline = '';
  String status = FarmTaskStatus.pending.name;
  String farm_id = '';

  TaskModel({
    this.title = '',
    this.priority = '',
    this.deadline = '',
    this.status = '',
    this.farm_id = '',
  });

  TaskModel.getData(Map<String, dynamic> map) {
    title = map["title"]??'';
    priority = map["priority"]??'';
    deadline = map["deadline"]??'';
    status = map["status"]??'';
    farm_id = map["farm_id"]??'';
  }

  Map<String, dynamic> getMap() {
    return {
      'title':title,
      'priority':priority,
      'deadline':deadline,
      'status':status,
      'unit':farm_id,
    };
  }

  Map<String, String?> selectedOptions = {
    'title': null,
    'priority': null,
    'deadline': null,
    'farm_id': null,
  };
}