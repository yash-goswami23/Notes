class Note {
  final int? id;
  final String title;
  final String desc;
  final bool isFav;
  const Note({
    this.id,
    required this.title,
    required this.desc,
    this.isFav = false,
  });
}
