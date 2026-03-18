import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> _history = [];

  @override
  List<RidePreference> getHistory() {
    return _history;
  }

  @override
  void saveToHistory(RidePreference ridePreference) {
    _history.add(ridePreference);
  }
  
}