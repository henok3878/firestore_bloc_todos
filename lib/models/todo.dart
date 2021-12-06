import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final String note;
  final String title;
  final bool isDone;
  final String id;

  Todo(this.title, {String? note, String? id, this.isDone = false})
      : this.note = note ?? '',
        this.id = id ?? const Uuid().v4();

  Todo copyWith({bool? isDone, String? id, String? note, String? title}) {
    return Todo(title ?? this.title,
        id: id ?? this.id,
        note: note ?? this.note,
        isDone: isDone ?? this.isDone);
  }

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return 'Todo { complete: $isDone, task: $title, note: $note, id: $id }';
  }
}
