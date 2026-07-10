import 'package:flutter/material.dart';

import '../../../learner/domain/entities/learner.dart';

class LearningWorkspacePage extends StatelessWidget {
  const LearningWorkspacePage({required this.learner, super.key});

  final Learner learner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(learner.fullName)),
      body: Center(child: Text('Learning Workspace for ${learner.fullName}')),
    );
  }
}
