class ToDo {
  final String title;
  final String description;

  const ToDo({required this.title, required this.description});

  static List<ToDo> generateData() => List.generate(
      20,
          (index) => ToDo(
          title: 'Sample Todo ${index+1}',
          description: 'Sample Todo description ${index+1}'));
}
