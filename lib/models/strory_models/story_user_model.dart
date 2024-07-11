//
// class StoryUserModel {
//   late String storyUserId;
//   late String reStoryId;
//   late String content;
//   late List imageUrl;
//   late List videoUrl;
//   late List optionQesition;
//   late int    likeCount;
//   late String timestamp;
//   late String userId;
//   late String? feeling;
//   late List mentionedFriendsId;
//
//   StoryUserModel();
//
//   StoryUserModel.fromJson(Map<dynamic, dynamic> documentMap) {
//     print('startForm');
//     content = documentMap['content'];
//     imageUrl = documentMap['imageUrl'];
//     likeCount = documentMap['likeCount'];
//     timestamp = documentMap['timestamp'];
//     userId = documentMap['userId'];
//     mentionedFriendsId = documentMap['mentionedFriendsId'];
//     feeling = documentMap['feeling'];
//     optionQesition = documentMap['optionQesition'];
//     storyUserId = documentMap['storyUserId'];
//     reStoryId = documentMap['reStoryId'];
//     videoUrl = documentMap['videoUrl'];
//     print('endForm');
//   }
//
//   Map<String ,dynamic> toMap(){
//     print('startToMap');
//     Map<String ,dynamic> map = <String ,dynamic> {};
//     map['storyUserId'] = storyUserId;
//     map['reStoryId'] = reStoryId;
//     map['videoUrl'] = videoUrl;
//     map['content'] = content;
//     map['imageUrl'] = imageUrl;
//     map['likeCount']  = likeCount;
//     map['timestamp']  = timestamp;
//     map['userId'] = userId;
//     map['mentionedFriendsId']  = mentionedFriendsId;
//     map['feeling']  = feeling;
//     map['optionQesition']  = optionQesition;
//     print('endToMap');
//     return map;
//   }
// }