import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/add_farm_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/farm_details_page.dart';
import 'package:masl_futa_agric/service/local_storage.dart';
import 'package:masl_futa_agric/viewmodel/FarmPageViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class FarmPage extends StatelessWidget {
  const FarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FarmPageViewModel>.nonReactive(
      viewModelBuilder: () => FarmPageViewModel(),
      builder: (context, model, _) {
        model.getFarmDetailsFromLocal();
        return const FarmListPage();
      },
    );
  }
}

class EmptyFarmListPage extends StatelessWidget {
  const EmptyFarmListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Farms',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4C586F),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Navigate to the page for adding new farms
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddFarmPage()),
                    );
                  },
                ),
              ],
            ),
            Image.asset('assets/images/peasant tools.png'),
            const Text(
              'No farm added yet, press the add button in the top right corner to add a new task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7988A4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FarmListPage extends StackedHookView<FarmPageViewModel> {
  const FarmListPage({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, FarmPageViewModel model) {
    if (model.farmDetails.isEmpty) {
      return const EmptyFarmListPage();
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Farms',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4C586F),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      // Navigate to the page for adding new farms
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddFarmPage()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: model.farmDetails.length,
                  itemBuilder: (context, index) {
                    final farm = model.farmDetails[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the full view of the farm
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullFarmViewPage(farm),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F4CD),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFF011F14)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  farm.farmName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF026742),
                                  ),
                                ),
                                Text(
                                  farm.farmLocation,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF026742),
                                  ),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFF026742),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
