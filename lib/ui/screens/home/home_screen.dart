import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ridePrefState = context.read<RidePreferenceState>();

    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(ridePrefState: ridePrefState),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) => HomeContent(viewModel: viewModel),
      ),
    );
  }
}
