// ignore_for_file: public_member_api_docs, sort_constructors_first
class Entry {
  int id;
  String name;
  String imageURL;
  String description;
  List<String> tags;

  Entry({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.description,
    required this.tags,
  });
}
