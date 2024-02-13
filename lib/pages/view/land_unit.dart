import 'package:flutter/material.dart';
import 'package:masl_futa_agric/viewmodel/add_farm_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class LandUnits extends StackedHookView<AddFarmViewModel> {
  const LandUnits({super.key});

  @override
  Widget builder(BuildContext context, AddFarmViewModel model) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            model.setSelectedUnit('Plots');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(),
              color: model.selectedUnit == 'Plots'
                  ? const Color(0xff026742)
                  : const Color(0xffF7F8F9),
            ),
            child: Text(
              'Plots',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: model.selectedUnit == 'Plots'
                    ? Colors.white
                    : const Color(0xff026742),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            model.setSelectedUnit("Acres");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(6),
              color: model.selectedUnit == 'Acres'
                  ? const Color(0xff026742)
                  : const Color(0xffF7F8F9),
            ),
            child: Text(
              'Acres',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: model.selectedUnit == 'Acres'
                    ? Colors.white
                    : const Color(0xff026742),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            model.setSelectedUnit('Hectares');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(6),
              color: model.selectedUnit == 'Hectares'
                  ? const Color(0xff026742)
                  : const Color(0xffF7F8F9),
            ),
            child: Text(
              'Hectares',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: model.selectedUnit == 'Hectares'
                    ? Colors.white
                    : const Color(0xff026742),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
