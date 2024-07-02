
class CommentsModel {
  late String postId;
  late String userId;
  late String commentId;
  late String comment;
  late String timestamp;

  CommentsModel();

  CommentsModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    postId = documentMap['postId'];
    userId = documentMap['userId'];
    commentId = documentMap['commentId'];
    comment = documentMap['comment'];
    timestamp = documentMap['timestamp'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['postId'] = postId;
    map['userId'] = userId;
    map['comment'] = comment;
    map['commentId'] = commentId;
    map['timestamp']  = timestamp;
    print('endToMap');
    return map;
  }
}