
enum LearnerStatus {
  active,
  archived,
  inactive,
}

class Learner {
  const Learner({
    required this.id,
    required this.fullName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.email,
    this.phoneNumber,
    this.avatarUrl,
  });

  final String id;
  final String fullName;
  final String? email;
  final String? phoneNumber;
  final String? avatarUrl;
  final LearnerStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
}
