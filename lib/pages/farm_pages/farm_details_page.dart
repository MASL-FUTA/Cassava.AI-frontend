import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/add_new_tasks_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/view/app_bar.dart';
import 'package:masl_futa_agric/utils/colors.dart';
import 'package:masl_futa_agric/utils/util.dart';
import 'package:masl_futa_agric/viewmodel/farms_details_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'model/task_model.dart';

class FullFarmViewPage extends StatelessWidget {
  final FarmDetails farm;
  const FullFarmViewPage(this.farm, {super.key});

  @override
  Widget build(BuildContext context) {
    final defaultLeadingWidth = AppBarTheme.of(context).iconTheme?.size ?? 56.0;
    return ViewModelBuilder<FarmDetailsViewModel>.nonReactive(
      viewModelBuilder: () => FarmDetailsViewModel(),
      builder: (_, model, __) {
        model.setFarmDetails(farm);
        return Scaffold(
          appBar: AppBar(
            leadingWidth: defaultLeadingWidth + 16,
            leading: AppBackButton(
              func: () => Navigator.pop(context),
            ),
            title: Text(farm.farmName),
          ),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                FarmWeatherCard(farm: farm),
                const TabBar(tabs: [Tab(text: 'Overview'), Tab(text: 'Task')]),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: Text('Overview')),
                      TaskPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FarmWeatherCard extends StackedHookView<FarmDetailsViewModel> {
  final FarmDetails farm;

  const FarmWeatherCard({super.key, required this.farm});

  @override
  Widget builder(BuildContext context, FarmDetailsViewModel model) {
    return Container();
  }
}

class TaskPage extends StackedHookView<FarmDetailsViewModel> {
  const TaskPage({super.key});

  @override
  Widget builder(BuildContext context, FarmDetailsViewModel model) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Pending'),
                Tab(text: 'Ongoing'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TaskListPage(status: 'pending'),
                  TaskListPage(status: 'ongoing'),
                  TaskListPage(status: 'completed'),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.appAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewTaskPage(farm: model.farmDetails),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TaskListPage extends StackedHookView<FarmDetailsViewModel> {
  final String status;

  const TaskListPage({super.key, required this.status});

  @override
  Widget builder(BuildContext context, FarmDetailsViewModel model) {
    //LocalStorage.clear();
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<TaskModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              child: CircularProgressIndicator(color: AppColors.appColor),
            ),
          );
        }
        var taskList = snapshot.data ?? [];
        return ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            var data = taskList[index];
            Color taskPriorityColor = Colors.transparent;
            switch(data.priority.toLowerCase()){
              case 'high':
                taskPriorityColor = AppColors.highTask;
                break;
              case 'medium':
                taskPriorityColor = AppColors.mediumTask;
                break;
              case 'low':
                taskPriorityColor = AppColors.lowTask;
                break;
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Deadline',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.appAccent,
                        ),
                        child: Text(
                          Util.date2(data.deadline),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Priority',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: taskPriorityColor,
                        ),
                        child: Text(
                          data.priority,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
      future: model.getFarmTasks(status),
    );
  }
}
