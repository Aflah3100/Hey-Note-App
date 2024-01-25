//notemodel
class NoteModel {
  String id;
  String title;
  String content;

  NoteModel({required this.id, required this.title, required this.content});

  //function
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'content': content};
  }
}
