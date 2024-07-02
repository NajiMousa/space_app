
class StoryDataModel {
  late String storyId;
  late String content;
  late String imageUrls;
  late String videoUrls;
  late String martyrIds;
  late String userDataId;
  late String timestamp;
  late List likes;


  StoryDataModel();

  StoryDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    storyId = documentMap['storyId'];
    content = documentMap['content'];
    imageUrls = documentMap['imageUrls'];
    videoUrls = documentMap['videoUrls'];
    martyrIds = documentMap['martyrIds'];
    userDataId = documentMap['userDataId'];
    timestamp = documentMap['timestamp'];
    likes = documentMap['likes'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['storyId'] = storyId;
    map['content'] = content;
    map['imageUrls'] = imageUrls;
    map['videoUrls'] = videoUrls;
    map['martyrIds'] = martyrIds;
    map['userDataId'] = userDataId;
    map['timestamp']  = timestamp;
    print('endToMap');
    return map;
  }
}