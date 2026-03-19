import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_selection_content.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RidePreferenceState ridePreferenceState = context
        .read<RidePreferenceState>();
    final RideRepository rideRepository = context.read<RideRepository>();

    return ChangeNotifierProvider(
      create: (_) => RideSelectionViewModel(
        ridePrefState: ridePreferenceState,
        rideRepo: rideRepository,
      ),
      child: Consumer<RideSelectionViewModel>(
        builder: (context, rideSelectionVM, child) =>
            RideSelectionContent(rideSelectionVM: rideSelectionVM),
      ),
    );
  }
}
