import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:masl_futa_agric/enums/farm_task_status.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/task_model.dart';
import 'package:masl_futa_agric/service/local_storage.dart';
import 'package:masl_futa_agric/utils/colors.dart';
import 'package:masl_futa_agric/utils/util.dart';
import 'package:stacked/stacked.dart';

class FarmDetailsViewModel extends BaseViewModel {
  List<TaskModel> _taskList = [];
  List<TaskModel> get taskList => _taskList;

  FarmDetails _farmDetails = FarmDetails();

  FarmDetails get farmDetails => _farmDetails;

  List<String> priorityLevel = ['High', 'Medium', 'Low'];

  GlobalKey _priorityLevelKey = GlobalKey();

  GlobalKey get priorityLevelKey => _priorityLevelKey;

  OverlayEntry? _overlayEntry;

  OverlayEntry get overlayEntry =>
      _overlayEntry ??
      OverlayEntry(
        builder: (BuildContext context) {
          return const SizedBox();
        },
      );

  bool _overlayShowing = false;

  bool get overlayShowing => _overlayShowing;

  TextEditingController _titleController = TextEditingController();

  TextEditingController get titleController => _titleController;

  String _priority = "Select";

  String get priority => _priority;

  String _deadline = "";

  String _deadlineText = "Deadline";

  String get deadlineText => _deadlineText;

  String _farmID = "";

  String get farmID => _farmID;

  setFarmDetails(FarmDetails farm) {
    _farmDetails = farm;
    notifyListeners();
  }

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

  Future<List<TaskModel>> getFarmTasks(String status) async {
    List<TaskModel> finalList = [];
    var json = await LocalStorage.getString(
        'task${_farmDetails.farmName}${_farmDetails.farmLocation}');
    List tasks = jsonDecode(json);
    var list = tasks.map((e) => TaskModel.getData(e)).toList();
    for(TaskModel m in list){
      if(m.status == status) finalList.add(m);
    }
    return Future.value(finalList);
  }

  Future<bool> saveTask() async {
    var title = _titleController.text.toString().trim();
    if (title.isEmpty) {
      return false;
    } else if (_priority.isEmpty || _priority.toLowerCase() == 'select') {
      return false;
    } else if (_deadline.isEmpty) {
      return false;
    }
    var task = TaskModel(
      title: title,
      priority: _priority,
      deadline: _deadline,
      farm_id: '${_farmDetails.farmName}${_farmDetails.farmLocation}',
      status: FarmTaskStatus.pending.name,
    );
    var json = await LocalStorage.getString(
        'task${_farmDetails.farmName}${_farmDetails.farmLocation}');
    if (json.isNotEmpty) {
      List farms = jsonDecode(json);
      var list = farms.map((e) => TaskModel.getData(e).getMap()).toList();
      list.add(task.getMap());
      await LocalStorage.setString(
          'task${_farmDetails.farmName}${_farmDetails.farmLocation}', jsonEncode(list));
    } else {
      await LocalStorage.setString('task${_farmDetails.farmName}${_farmDetails.farmLocation}',
          jsonEncode([task.getMap()]));
    }
    return true;
  }

  void hideOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayShowing = false;
      _overlayEntry = null;
    }
  }

  showDatesPicker(BuildContext context) async {
    var picker = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch + 100000000000,
      ),
    );
    if (picker != null) {
      _deadline = picker.millisecondsSinceEpoch.toString();
      _deadlineText = Util.date2(_deadline);
      notifyListeners();
    }
  }

  showOverlay(BuildContext context) {
    if (_overlayShowing) return;
    var size = MediaQuery.of(context).size;
    final RenderBox renderBox =
        _priorityLevelKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (_) {
        return Material(
          color: Colors.grey.withOpacity(0.1),
          child: InkWell(
            onTap: () => hideOverlay(),
            child: Stack(
              children: [
                Positioned(
                  top: position.dy + 50,
                  child: Wrap(
                    children: [
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.all(32),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              children: List.generate(
                                priorityLevel.length,
                                (index) {
                                  var text = priorityLevel[index];
                                  var color = Colors.transparent;
                                  switch (text.toLowerCase()) {
                                    case 'high':
                                      color = AppColors.highTask;
                                      break;
                                    case 'medium':
                                      color = AppColors.mediumTask;
                                      break;
                                    case 'low':
                                      color = AppColors.lowTask;
                                      break;
                                  }
                                  return InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      hideOverlay();
                                      setPriority(text);
                                    },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 12),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: color,
                                            ),
                                            child: Text(text),
                                          ),
                                          const SizedBox(height: 11),
                                          if (index + 1 < priorityLevel.length)
                                            const Divider(),
                                          if (index + 1 == priorityLevel.length)
                                            const SizedBox(height: 5),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
    _overlayShowing = _overlayEntry!.mounted;
    notifyListeners();
  }
}
