import 'package:flutter/material.dart';
import 'package:masl_futa_agric/viewmodel/farm_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class LandUnits extends StackedHookView<FarmViewModel> {
  const LandUnits({super.key});

  @override
  Widget builder(BuildContext context, FarmViewModel model) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            model.setSelectedUnit('Plots');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: model.selectedUnit == 'Plots'
                  ? Color(0xff026742)
                  : Color(0xffF7F8F9),
            ),
            child: Text(
              'Plots',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: model.selectedUnit == 'Plots'
                    ? Colors.white
                    : Color(0xff026742),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            model.setSelectedUnit("Acres");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: model.selectedUnit == 'Acres'
                  ? Color(0xff026742)
                  : Color(0xffF7F8F9),
            ),
            child: Text(
              'Acres',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: model.selectedUnit == 'Acres'
                    ? Colors.white
                    : Color(0xff026742),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            model.setSelectedUnit('Hectares');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: model.selectedUnit == 'Hectares'
                  ? Color(0xff026742)
                  : Color(0xffF7F8F9),
            ),
            child: Text(
              'Hectares',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: model.selectedUnit == 'Hectares'
                    ? Colors.white
                    : Color(0xff026742),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
