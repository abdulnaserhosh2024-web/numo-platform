import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/value_objects/goal_draft.dart';

class GoalDiscoveryController extends StateNotifier<GoalDraft> {
  GoalDiscoveryController() : super(const GoalDraft());

  void updateOutcome(String value) {
    state = state.copyWith(desiredOutcome: value);
  }

  void updateMotivation(String value) {
    state = state.copyWith(motivation: value);
  }

  void updateSuccessCriteria(String value) {
    state = state.copyWith(successCriteria: value);
  }

  void reset() {
    state = const GoalDraft();
  }
}

final goalDiscoveryControllerProvider =
    StateNotifierProvider<GoalDiscoveryController, GoalDraft>(
      (ref) => GoalDiscoveryController(),
    );
