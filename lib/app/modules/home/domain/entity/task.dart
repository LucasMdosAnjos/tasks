// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  final int id;
  final String description;
  final CategoryTask category;
  final bool check;
  const Task({
    required this.id,
    required this.description,
    required this.category,
    required this.check,
  });
}

enum CategoryTask { work, personal, household }
