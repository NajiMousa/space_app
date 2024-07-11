

class RepostModel {
  late String repostId;
  late String postId;
  late String userId;
  late String repostContent;
  late String timestamp;

  RepostModel();

  RepostModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    repostId = documentMap['repostId'];
    postId = documentMap['postId'];
    userId = documentMap['userId'];
    timestamp = documentMap['timestamp'];
    repostContent = documentMap['repostContent'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['repostId'] = repostId;
    map['postId'] = postId;
    map['userId'] = userId;
    map['timestamp']  = timestamp;
    map['repostContent']  = repostContent;
    print('endToMap');
    return map;
  }
}