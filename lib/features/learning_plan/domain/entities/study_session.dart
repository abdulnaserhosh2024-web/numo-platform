enum StudySessionStatus { planned, completed, skipped }

class StudySession {
  const StudySession({
    required this.id,
    required this.title,
    required this.scheduledAt,
    required this.durationMinutes,
    required this.status,
    this.subject,
    this.description,
    this.completedAt,
  });

  final String id;
  final String title;
  final String? subject;
  final String? description;
  final DateTime scheduledAt;
  final int durationMinutes;
  final StudySessionStatus status;
  final DateTime? completedAt;

  bool get isCompleted => status == StudySessionStatus.completed;

  bool get isUpcoming =>
      status == StudySessionStatus.planned &&
      scheduledAt.isAfter(DateTime.now());

  StudySession copyWith({
    String? id,
    String? title,
    String? subject,
    String? description,
    DateTime? scheduledAt,
    int? durationMinutes,
    StudySessionStatus? status,
    DateTime? completedAt,
    bool clearCompletedAt = false,
  }) {
    return StudySession(
      id: id ?? this.id,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      status: status ?? this.status,
      completedAt: clearCompletedAt ? null : completedAt ?? this.completedAt,
    );
  }

  StudySession markCompleted({DateTime? at}) {
    return copyWith(
      status: StudySessionStatus.completed,
      completedAt: at ?? DateTime.now(),
    );
  }

  StudySession markSkipped() {
    return copyWith(status: StudySessionStatus.skipped, clearCompletedAt: true);
  }
}
