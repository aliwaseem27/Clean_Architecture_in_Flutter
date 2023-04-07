import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String id;
  final String author;
  final String content;

  const Quote({
    required this.id,
    required this.author,
    required this.content,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}

// {"_id":"0UycoCApLT",
// "author":"Alan Watts",
// "content":"Trying to define yourself is like trying to bite your own teeth.",
// "tags":["humor"],
// "authorSlug":"alan-watts",
// "length":64,
// "dateAdded":"2022-03-12",
// "dateModified":"2022-03-12"}
