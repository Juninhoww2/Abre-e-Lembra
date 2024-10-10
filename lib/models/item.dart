class Item {
  String id;
  String name;
  String location;
  String description;
  DateTime dateAdded;
  String? imagePath;

  Item({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.dateAdded,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'description': description,
      'dateAdded': dateAdded.toIso8601String(),
      'imagePath': imagePath,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      location: map['location'],
      description: map['description'],
      dateAdded: DateTime.parse(map['dateAdded']),
      imagePath: map['imagePath'],
    );
  }
}
