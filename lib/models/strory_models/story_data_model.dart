
class StoryDataModel {
  late String storyId;
  late String text;
  late List image;
  late List video;
  late List martyrIds;
  late List mentionedFriendsId;
  late String userDataId;
  late String timestamp;
  late int likes;
  late bool withFollower;


  StoryDataModel();

  StoryDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    storyId = documentMap['storyId'];
    text = documentMap['text'];
    image = documentMap['image'];
    video = documentMap['video'];
    martyrIds = documentMap['martyrIds'];
    userDataId = documentMap['userDataId'];
    timestamp = documentMap['timestamp'];
    mentionedFriendsId = documentMap['mentionedFriendsId'];
    withFollower = documentMap['withFollower'];
    likes = documentMap['likes'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['storyId'] = storyId;
    map['text'] = text;
    map['image'] = image;
    map['video'] = video;
    map['martyrIds'] = martyrIds;
    map['userDataId'] = userDataId;
    map['timestamp']  = timestamp;
    map['mentionedFriendsId']  = mentionedFriendsId;
    map['withFollower']  = withFollower;
    map['likes']  = likes;
    print('endToMap');
    return map;
  }
}
