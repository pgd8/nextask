class TaskModel {
  String? id;
  String title;
  String description;
  bool? isCompleted;
  String dateTime;
  String category;
  int piriority;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    this.isCompleted,
    required this.dateTime,
    required this.category,
    required this.piriority,
  });

  factory TaskModel.fromFireStore(Map<String, dynamic> json) => TaskModel(
    id: json['id'] ?? '',
    title: json['title'],
    description: json['description'],
    isCompleted: json['isCompleted'] ?? false,
    dateTime: json['dateTime'],
    category: json['category'],
    piriority: json['piriority'],
  );

  Map<String, dynamic> toFireStore() => {
    'id': id ?? '',
    'title': title,
    'description': description,
    'isCompleted': isCompleted ?? false,
    'dateTime': dateTime,
    'category': category,
    'piriority': piriority,
  };
}
