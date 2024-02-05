import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/view/farm_soil.dart';
import 'package:masl_futa_agric/service/local_storage.dart';
import 'package:masl_futa_agric/viewmodel/farm_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SoilInformationPage extends StackedHookView<FarmViewModel> {
  final PageController pageController;

  const SoilInformationPage({super.key, required this.pageController});

  @override
  Widget builder(BuildContext context, FarmViewModel model) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Soil Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Soil Information',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xff4C586F),
              ),
            ),
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
                  pageController.nextPage(
                    duration: const Duration(seconds: 1),
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
    );
  }
}
