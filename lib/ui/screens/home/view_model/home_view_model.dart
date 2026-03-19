import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePrefState;

  HomeViewModel({required this.ridePrefState}){
    ridePrefState.addListener(_onPrefChanged);
  }

  RidePreference? get selectedPreference => ridePrefState.selectedPreference;
  List<RidePreference> get preferenceHistory => ridePrefState.preferenceHistory;

  void selectPreference(RidePreference preference) {
    ridePrefState.selectPreference(preference);
  }

  void _onPrefChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    ridePrefState.removeListener(_onPrefChanged);
    super.dispose();
  }
}