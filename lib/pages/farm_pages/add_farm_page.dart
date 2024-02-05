import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/soil_information_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/soil_properties_page.dart';
import 'package:masl_futa_agric/pages/view/app_bar.dart';
import 'package:masl_futa_agric/pages/view/land_unit.dart';
import 'package:masl_futa_agric/pages/view/plant_stages.dart';
import 'package:masl_futa_agric/service/local_storage.dart';
import 'package:masl_futa_agric/viewmodel/farm_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class AddFarmPage extends StatefulWidget {
  @override
  State<AddFarmPage> createState() => _AddFarmPageState();
}

class _AddFarmPageState extends State<AddFarmPage> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FarmViewModel>.nonReactive(
      viewModelBuilder: () => FarmViewModel(),
      builder: (BuildContext context, FarmViewModel model, _) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                PageIndicator(pageCount: 3, currentPage: currentPage),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    children: [
                      // Page 1
                      AddFarmPage1(pageController: pageController),
                      // Page 2
                      SoilInformationPage(pageController: pageController),
                      //Page 3
                      SoilPropertyPage(pageController: pageController),
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

class PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  PageIndicator({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pageCount, (index) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 7.0,
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: index == currentPage
                    ? Color(0xffE7EEB0)
                    : Color(0xff026742),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class AddFarmPage1 extends StackedHookView<FarmViewModel> {
  final PageController pageController;

  const AddFarmPage1({super.key, required this.pageController});

  @override
  Widget builder(BuildContext context, FarmViewModel model) {
    final defaultLeadingWidth = AppBarTheme.of(context).iconTheme?.size ?? 56.0;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: defaultLeadingWidth + 16,
        leading: AppBackButton(
          func: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Soil Information',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xff4C586F),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Add New Farm',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff4C586F)),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: model.farmNameController,
              decoration: InputDecoration(
                labelText: 'Enter Farm Name',
                labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7988A4)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: const Color(0xffF7F8F9),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: model.farmLocationController,
              decoration: InputDecoration(
                labelText: 'Enter Farm Location',
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7988A4),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: const Color(0xffF7F8F9),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: model.farmSizeController,
                    decoration: InputDecoration(
                      labelText: 'Farm Size ?',
                      labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7988A4)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: const Color(0xffF7F8F9),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unit',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7988A4),
                            fontSize: 14),
                      ),
                      LandUnits(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const PlantStages(),
            const SizedBox(height: 32),
            SizedBox(
              width: 331,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff026742),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  var farmDetails = FarmDetails(
                    farmName: model.farmNameController.text,
                    farmLocation: model.farmLocationController.text,
                    farmSize: model.farmSizeController.text,
                    unit: model.selectedUnit,
                    stage: model.selectedStage,
                  );

                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                },
                child: const Text(
                  'Proceed',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
