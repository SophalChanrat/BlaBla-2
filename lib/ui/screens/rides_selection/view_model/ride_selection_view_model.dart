import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePrefState;
  final RideRepository rideRepo;

  RidePreference? get currentRidePreference => ridePrefState.selectedPreference;
  List<RidePreference> get history => ridePrefState.preferenceHistory;

  RideSelectionViewModel({required this.ridePrefState, required this.rideRepo}) {
    ridePrefState.addListener(_onPrefChanged);
  }

  void _onPrefChanged() {
    notifyListeners();
  }

  void selectPreference(RidePreference preference) {
    ridePrefState.selectPreference(preference);
  }

  List<Ride> getMatchingRides() {
    if (currentRidePreference == null) {
      return [];
    } 
    return rideRepo.getRides(currentRidePreference!);
  }

  @override
  void dispose() {
    ridePrefState.removeListener(_onPrefChanged);
    super.dispose();
  }
}