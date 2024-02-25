import 'package:flutter/material.dart';
import 'package:masl_futa_agric/utils/colors.dart';
import 'package:masl_futa_agric/viewmodel/auth_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SignInProgress extends StackedHookView<AUthViewModel> {
  const SignInProgress({super.key});

  @override
  Widget builder(BuildContext context, AUthViewModel model) {
    var size = MediaQuery.of(context).size;
    if (!model.loading) return const SizedBox();
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.grey.withOpacity(0.3),
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(color: AppColors.appColor),
        ),
      ),
    );
  }
}
