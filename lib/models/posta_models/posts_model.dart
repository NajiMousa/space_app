
class PostsModel {
  // String? id;
  late String postId;
  late String type;
  late String content;
  late String imageUrl;
  late String videoUrl;
  late String audioUrl;
  late String mentions;
  late int    likeCount;
  late int    commentCount;
  late String repostCount;
  late String timestamp;
  late String userId;
  // late String mentionedFriendsId;
  // late String savedId;
  // late String repostId;
  // late String likeId;
  // late String commentId;

  PostsModel();

  PostsModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    postId = documentMap['postId'];
    type = documentMap['type'];
    content = documentMap['content'];
    imageUrl = documentMap['imageUrl'];
    videoUrl = documentMap['videoUrl'];
    audioUrl = documentMap['audioUrl'];
    mentions = documentMap['mentions'];
    likeCount = documentMap['likeCount'];
    commentCount = documentMap['commentCount'];
    repostCount = documentMap['repostCount'];
    timestamp = documentMap['timestamp'];
    userId = documentMap['userId'];
    // mentionedFriendsId = documentMap['mentionedFriendsId'];
    // savedId = documentMap['savedId'];
    // repostId = documentMap['repostId'];
    // likeId = documentMap['likeId'];
    // commentId = documentMap['commentId'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['postId'] = postId;
    map['type'] = type;
    map['content'] = content;
    map['imageUrl'] = imageUrl;
    map['videoUrl'] = videoUrl;
    map['audioUrl']  = audioUrl;
    map['mentions']  = mentions;
    map['likeCount']  = likeCount;
    map['commentCount']  = commentCount;
    map['repostCount']  = repostCount;
    map['timestamp']  = timestamp;
    map['userId'] = userId;
    // map['mentionedFriendsId']  = mentionedFriendsId;
    // map['savedId']  = savedId;
    // map['repostId']  = repostId;
    // map['likeId']  = likeId;
    // map['commentId']  = commentId;
    print('endToMap');
    return map;
  }
}