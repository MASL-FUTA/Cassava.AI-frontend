import 'package:hive/hive.dart';



class TaskModel {
  String title = '';
  String priority = '';
  String deadline = '';
  String farmID = 'farmID';

  TaskModel({
    this.title = '',
    this.priority = '',
    this.deadline = '',
    this.farmID = 'farmID',
  });

  TaskModel.getData(Map<String, dynamic> map) {
    title = map["title"];
    priority = map["priority"];
    deadline = map["deadline"];
    farmID = map["farmID"];
  }

  Map<String, dynamic> getMap() {
    return {
      'title':title,
      'priority':priority,
      'deadline':deadline,
      'unit':farmID,
    };
  }

  Map<String, String?> selectedOptions = {
    'title': null,
    'priority': null,
    'deadline': null,
    'farmID': null,
  };
}