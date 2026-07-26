import 'study_session.dart';

enum LearningPlanStatus { draft, active, completed, paused }

class LearningPlan {
  const LearningPlan({
    required this.id,
    required this.goalId,
    required this.title,
    required this.dailyStudyMinutes,
    required this.startDate,
    required this.targetDate,
    required this.status,
    required this.sessions,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String goalId;
  final String title;
  final int dailyStudyMinutes;
  final DateTime startDate;
  final DateTime targetDate;
  final LearningPlanStatus status;
  final List<StudySession> sessions;
  final DateTime createdAt;
  final DateTime updatedAt;

  int get completedSessionsCount =>
      sessions.where((session) => session.isCompleted).length;

  int get totalSessionsCount => sessions.length;

  double get progress {
    if (sessions.isEmpty) return 0;

    return completedSessionsCount / totalSessionsCount;
  }

  bool get isComplete =>
      sessions.isNotEmpty && completedSessionsCount == totalSessionsCount;

  StudySession? get nextSession {
    final upcomingSessions =
        sessions
            .where((session) => session.status == StudySessionStatus.planned)
            .toList()
          ..sort(
            (first, second) => first.scheduledAt.compareTo(second.scheduledAt),
          );

    return upcomingSessions.isEmpty ? null : upcomingSessions.first;
  }

  LearningPlan copyWith({
    String? id,
    String? goalId,
    String? title,
    int? dailyStudyMinutes,
    DateTime? startDate,
    DateTime? targetDate,
    LearningPlanStatus? status,
    List<StudySession>? sessions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LearningPlan(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      title: title ?? this.title,
      dailyStudyMinutes: dailyStudyMinutes ?? this.dailyStudyMinutes,
      startDate: startDate ?? this.startDate,
      targetDate: targetDate ?? this.targetDate,
      status: status ?? this.status,
      sessions: sessions ?? this.sessions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  LearningPlan updateSession(StudySession updatedSession) {
    final updatedSessions = sessions
        .map(
          (session) =>
              session.id == updatedSession.id ? updatedSession : session,
        )
        .toList(growable: false);

    return copyWith(
      sessions: updatedSessions,
      updatedAt: DateTime.now(),
      status:
          updatedSessions.isNotEmpty &&
              updatedSessions.every((session) => session.isCompleted)
          ? LearningPlanStatus.completed
          : status,
    );
  }
}
