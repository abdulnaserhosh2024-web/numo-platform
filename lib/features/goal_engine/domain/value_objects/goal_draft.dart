class GoalDraft {
  final String? desiredOutcome;
  final String? motivation;
  final String? successCriteria;

  const GoalDraft({this.desiredOutcome, this.motivation, this.successCriteria});

  GoalDraft copyWith({
    String? desiredOutcome,
    String? motivation,
    String? successCriteria,
  }) {
    return GoalDraft(
      desiredOutcome: desiredOutcome ?? this.desiredOutcome,
      motivation: motivation ?? this.motivation,
      successCriteria: successCriteria ?? this.successCriteria,
    );
  }

  bool get isComplete =>
      desiredOutcome != null &&
      desiredOutcome!.trim().isNotEmpty &&
      motivation != null &&
      motivation!.trim().isNotEmpty &&
      successCriteria != null &&
      successCriteria!.trim().isNotEmpty;
}
