import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  final ridePrefRepository = RidePreferenceRepositoryMock();

  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock(),),
    Provider<RideRepository>(create: (_) => RideRepositoryMock(),),
    Provider<RidePreferenceRepository>(create: (_) => ridePrefRepository,),

    ChangeNotifierProvider<RidePreferenceState>(create: (_) => RidePreferenceState(ridePrefRepo: ridePrefRepository)),
  ];
}

void main() {
  mainCommon(providers);
}