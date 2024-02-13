import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/view/app_bar.dart';
import 'package:masl_futa_agric/utils/colors.dart';
import 'package:masl_futa_agric/viewmodel/farms_details_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'bloc/bloc/farm_bloc_bloc.dart';
import 'farm_details_page.dart';

class AddNewTaskPage extends StatelessWidget {
  final FarmDetails farm;

  const AddNewTaskPage({super.key, required this.farm});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FarmDetailsViewModel>.nonReactive(
      viewModelBuilder: () => FarmDetailsViewModel(),
      builder: (_, model, __) {
        model.setFarmDetails(farm);
        return const AddNewTask();
      },
    );
  }
}

class AddNewTask extends StackedHookView<FarmDetailsViewModel> {
  const AddNewTask({super.key});

  @override
  Widget builder(BuildContext context, FarmDetailsViewModel model) {
    final defaultLeadingWidth = AppBarTheme.of(context).iconTheme?.size ?? 56.0;
    return PopScope(
      canPop: model.overlayShowing,
      onPopInvoked: (_) => model.hideOverlay(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: defaultLeadingWidth + 16,
          leading: AppBackButton(
            func: () {
              if (model.overlayShowing) {
                model.hideOverlay();
              } else {
                Navigator.pop(context);
              }
            },
          ),
          title: const Text(
            'Add New Task',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey)),
              child: TextFormField(
                controller: model.titleController,
                decoration: const InputDecoration(
                  hintText: 'Task Title',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              key: model.priorityLevelKey,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey)),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => model.showOverlay(context),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          const Text(
                            'Priority Level',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            model.priority,
                            style: TextStyle(
                              color: model.priority.toLowerCase() == 'select'
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const RotatedBox(
                          quarterTurns: 3,
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () => model.showDatesPicker(context),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey)),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        model.deadlineText,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.appColor),
              ),
              onPressed: () async {
                var res = await model.saveTask();
                if (res && context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullFarmViewPage(model.farmDetails),
                    ),
                  );
                }
              },
              child: const Text(
                'Proceed',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
