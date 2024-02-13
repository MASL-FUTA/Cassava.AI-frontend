import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/view/app_bar.dart';
import 'package:masl_futa_agric/utils/colors.dart';
import 'package:masl_futa_agric/viewmodel/farms_details_view_model.dart';
import 'package:stacked/stacked.dart';

class AddNewTaskPage extends StatelessWidget {
  final FarmDetailsViewModel initModel;

  const AddNewTaskPage({super.key, required this.initModel});

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
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey)),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text(
                            'Priority Level',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Priority Level',
                          ),
                          SizedBox(height: 8),
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
              Container(
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
                      const Text(
                        'Deadline',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 64),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.appColor),
                ),
                onPressed: () => model.saveTask(),
                child: const Text(
                  'Proceed',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
