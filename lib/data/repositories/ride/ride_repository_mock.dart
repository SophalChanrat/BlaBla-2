import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RideRepositoryMock implements RideRepository {

  @override
  List<Ride> getRides(RidePreference ridePreference) {
    return fakeRides
        .where((ride) =>
            ride.departureLocation == ridePreference.departure &&
            ride.arrivalLocation == ridePreference.arrival &&
            ride.availableSeats >= ridePreference.requestedSeats)
        .toList();
  }
}