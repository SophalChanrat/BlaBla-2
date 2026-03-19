import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  RidePreference? _selectedPreference;
  List<RidePreference> _preferenceHistory = [];
  final RidePreferenceRepository ridePrefRepo;


  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory => _preferenceHistory;

  RidePreferenceState({required this.ridePrefRepo}) {
    _init();
  }

  void _init() {
    _preferenceHistory = ridePrefRepo.getHistory();
    notifyListeners();
  }

  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {

      // Set the selected preference
      _selectedPreference = preference;
      
      // Push to history
      ridePrefRepo.saveToHistory(preference);
      notifyListeners();
    }
  }
}