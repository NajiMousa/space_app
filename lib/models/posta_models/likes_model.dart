
class LikesModel {
  late String likeId;
  late String postId;
  late String userId;
  late String timestamp;

  LikesModel();

  LikesModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    likeId = documentMap['likeId'];
    postId = documentMap['postId'];
    userId = documentMap['userId'];
    timestamp = documentMap['timestamp'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['likeId'] = likeId;
    map['postId'] = postId;
    map['userId'] = userId;
    map['timestamp']  = timestamp;
    print('endToMap');
    return map;
  }
}