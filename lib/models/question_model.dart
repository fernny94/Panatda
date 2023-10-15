class Question {
  final String id;

  final String title;

  final String Image;

  final Map<String, bool> options;

  Question({
    required this.id,
    required this.title,
    required this.Image,
    required this.options,
  });

  @override
  String toString() {
    return 'Question(id: $id, title: $title , Image: $Image, option: $options)';
  }
}
