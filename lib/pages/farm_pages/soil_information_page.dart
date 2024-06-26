import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/view/app_bar.dart';
import 'package:masl_futa_agric/pages/view/farm_soil.dart';
import 'package:masl_futa_agric/service/local_storage.dart';
import 'package:masl_futa_agric/viewmodel/add_farm_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SoilInformationPage extends StackedHookView<AddFarmViewModel> {
  final PageController pageController;

  const SoilInformationPage({super.key, required this.pageController});

  @override
  Widget builder(BuildContext context, AddFarmViewModel model) {
    final defaultLeadingWidth = AppBarTheme.of(context).iconTheme?.size ?? 56.0;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: defaultLeadingWidth + 16,
        leading: AppBackButton(
          func: () => pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: model.soilPHContoller,
                decoration: const InputDecoration(
                  labelText: 'Soil pH',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const FarmSoil(),
              const SizedBox(height: 20),
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
                  onPressed: () async {
                    if(model.soilPHContoller.text.trim().isEmpty) return;
                    if(model.selectedSoil.isEmpty) return;
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: const Text(
                    'Proceed',
                    style: TextStyle(color: Colors.white),
                  ), // Added child to ElevatedButton
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
