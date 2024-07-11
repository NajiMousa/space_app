
class SavedModel {
  late String savedId;
  late String postId;
  late String userId;
  late String martyrDataId;
  late String timestamp;

  SavedModel();

  SavedModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    savedId = documentMap['savedId'];
    postId = documentMap['postId'];
    userId = documentMap['userId'];
    martyrDataId = documentMap['martyrDataId'];
    timestamp = documentMap['timestamp'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['savedId'] = savedId;
    map['postId'] = postId;
    map['userId'] = userId;
    map['martyrDataId'] = martyrDataId;
    map['timestamp']  = timestamp;

    print('endToMap');
    return map;
  }
}