import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/service/local_storage.dart';
import 'package:stacked/stacked.dart';

class FarmDetailsViewModel extends BaseViewModel {
  TextEditingController _titleController= TextEditingController();
  TextEditingController get titleController=> _titleController;

  String _priority= "";
  String get priority=> _priority;

  String _deadline= "";
  String get deadline=> _deadline;

  String _farmID= "";
  String get farmID=> _farmID;

  setTitle(TextEditingController controller) {
    _titleController = controller;
    notifyListeners();
  }

  setPriority(String priority) {
    _priority = priority;
    notifyListeners();
  }

  setDeadline(String deadline) {
    _deadline = deadline;
    notifyListeners();
  }

  setFarmID(String farmID) {
    _farmID = farmID;
    notifyListeners();
  }

  saveTask() {}
}
