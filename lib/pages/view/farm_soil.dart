import 'package:flutter/material.dart';
import 'package:masl_futa_agric/viewmodel/add_farm_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class FarmSoil extends StackedHookView<AddFarmViewModel> {
  const FarmSoil({super.key});

  @override
  Widget builder(BuildContext context, AddFarmViewModel model) {
    return Container(
      width: 331,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: const Color(0xffE8ECF4),
        ),
        color: const Color(0xffF7F8F9),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: model.selectedSoil,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 20,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: (String? newValue) {
            if(newValue != null) model.setSelectedSoil(newValue);
          },
          items: <String>['Loamy soil', 'Sandy soil', 'clay soil']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
