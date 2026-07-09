enum LearningSessionStatus {
  scheduled,
  completed,
  cancelled,
  rescheduled,
}

enum AttendanceStatus {
  present,
  absent,
  late,
  excused,
}

class LearningSession {
  const LearningSession({
    required this.id,
    required this.goalId,
    required this.title,
    required this.status,
    required this.scheduledStart,
    required this.scheduledEnd,
    this.attendanceStatus,
    this.topic,
    this.summary,
    this.homework,
    this.nextAction,
    this.performanceRating,
  });

  final String id;
  final String goalId;
  final String title;
  final LearningSessionStatus status;
  final DateTime scheduledStart;
  final DateTime scheduledEnd;
  final AttendanceStatus? attendanceStatus;
  final String? topic;
  final String? summary;
  final String? homework;
  final String? nextAction;
  final int? performanceRating;
}
