import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final int? id;
  final String title;
  final String desc;
  final bool isFav;
  const NoteModel({
    this.id,
    required this.title,
    required this.desc,
    required this.isFav,
  });

  NoteModel copyWith({
    int? id,
    String? title,
    String? desc,
    bool? isFav,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      isFav: isFav ?? this.isFav,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'note_id': id,
      'note_title': title,
      'note_desc': desc,
      'note_fav': isFav ? 1 : 0,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['note_id'] as int,
      title: map['note_title'] as String,
      desc: map['note_desc'] as String,
      isFav: map['note_fav'] as int == 0 ? false : true,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title, desc, isFav];
}
