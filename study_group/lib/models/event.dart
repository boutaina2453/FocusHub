class Event {
  final String id;
  final String title;
  final DateTime date;
  final String description;

  Event({
    required this.id,
    required this.title,
    required this.date,
    this.description = '',
  });
}
