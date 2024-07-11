
class FollowModel {
  late String followTableId;
  late String followingId;
  late String userId;
  late String martyrDataId;
  late String timestamp;

  FollowModel();

  FollowModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    followTableId = documentMap['followTableId'];
    followingId = documentMap['followingId'];
    userId = documentMap['userId'];
    timestamp = documentMap['timestamp'];
    martyrDataId = documentMap['martyrDataId'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['followingId'] = followingId;
    map['userId'] = userId;
    map['followTableId'] = followTableId;
    map['timestamp']  = timestamp;
    map['martyrDataId']  = martyrDataId;

    print('endToMap');
    return map;
  }
}