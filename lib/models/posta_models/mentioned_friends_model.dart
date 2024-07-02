
class MentionedFriendsModel {
  late String mentionedFriendsId;
  late String postId;
  late String commentId;
  late String userDataId;
  late String timestamp;

  MentionedFriendsModel();

  MentionedFriendsModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    mentionedFriendsId = documentMap['mentionedFriendsId'];
    postId = documentMap['postId'];
    userDataId = documentMap['userDataId'];
    commentId = documentMap['commentId'];
    timestamp = documentMap['timestamp'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['mentionedFriendsId'] = mentionedFriendsId;
    map['postId'] = postId;
    map['userDataId'] = userDataId;
    map['commentId']  = commentId;
    map['timestamp']  = timestamp;
    print('endToMap');
    return map;
  }
}