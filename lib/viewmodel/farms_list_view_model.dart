import 'dart:convert';
import 'dart:developer';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/service/local_storage.dart';
import 'package:stacked/stacked.dart';

class FarmListViewModel extends BaseViewModel {
  List<FarmDetails> _farmDetails = [];
  List<FarmDetails> get farmDetails => _farmDetails;

  getFarmDetailsFromLocal() async {
    var json = await LocalStorage.getString("farmDetail");
    if (json.isNotEmpty) {
      List farms = jsonDecode(json);
      _farmDetails = farms.map((e) => FarmDetails.getData(e)).toList();
      notifyListeners();
    }
  }
}
