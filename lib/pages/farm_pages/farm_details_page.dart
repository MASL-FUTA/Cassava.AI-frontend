import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/add_new_tasks_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';
import 'package:masl_futa_agric/pages/view/app_bar.dart';
import 'package:masl_futa_agric/utils/colors.dart';
import 'package:masl_futa_agric/viewmodel/farms_details_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class FullFarmViewPage extends StatelessWidget {
  final FarmDetails farm;

  const FullFarmViewPage(this.farm, {super.key});

  @override
  Widget build(BuildContext context) {
    final defaultLeadingWidth = AppBarTheme.of(context).iconTheme?.size ?? 56.0;
    return ViewModelBuilder<FarmDetailsViewModel>.nonReactive(
        viewModelBuilder: () => FarmDetailsViewModel(),
        builder: (_, model, __) {
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
                  const TabBar(
                      tabs: [Tab(text: 'Overview'), Tab(text: 'Task')]),
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
        });
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
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Pending'),
                Tab(text: 'Ongoing'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TaskListPage(status: 'Pending'),
                  TaskListPage(status: 'Ongoing'),
                  TaskListPage(status: 'Completed'),
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
              MaterialPageRoute(builder: (context) => AddNewTaskPage(initModel: model)),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

class TaskListPage extends StatelessWidget {
  final String status;

  TaskListPage({required this.status});

  @override
  Widget build(BuildContext context) {
    // Add logic to fetch and display tasks based on the status
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
            // Task container with name, deadline, and priority
            );
      },
    );
  }
}
