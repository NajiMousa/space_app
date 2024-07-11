
class PostsModel {
  // String? id;
  late String postId;
  late String? mainPostId;
  late String type;
  late String content;
  late List imageUrl;
  late List fileUrl;
  late List subPost;
  // late List mentions;
  late List optionQesition;
  late int    likeCount;
  late int    commentCount;
  late int repostCount;
  late String timestamp;
  late String userId;
  late String? feeling;
  late List mentionedFriendsId;
  // late String savedId;
  // late String repostId;
  // late String likeId;
  // late String commentId;

  PostsModel();

  PostsModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    postId = documentMap['postId'];
    mainPostId = documentMap['mainPostId'];
    type = documentMap['type'];
    content = documentMap['content'];
    imageUrl = documentMap['imageUrl'];
    fileUrl = documentMap['fileUrl'];
    // audioUrl = documentMap['audioUrl'];
    // mentions = documentMap['mentions'];
    likeCount = documentMap['likeCount'];
    commentCount = documentMap['commentCount'];
    repostCount = documentMap['repostCount'];
    timestamp = documentMap['timestamp'];
    userId = documentMap['userId'];
    subPost = documentMap['subPost'];
    mentionedFriendsId = documentMap['mentionedFriendsId'];
    feeling = documentMap['feeling'];
    optionQesition = documentMap['optionQesition'];
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
    map['mainPostId'] = mainPostId;
    map['type'] = type;
    map['content'] = content;
    map['imageUrl'] = imageUrl;
    map['fileUrl'] = fileUrl;
    // map['audioUrl']  = audioUrl;
    // map['mentions']  = mentions;
    map['likeCount']  = likeCount;
    map['commentCount']  = commentCount;
    map['repostCount']  = repostCount;
    map['timestamp']  = timestamp;
    map['subPost']  = subPost;
    map['userId'] = userId;
    map['mentionedFriendsId']  = mentionedFriendsId;
    map['feeling']  = feeling;
    map['optionQesition']  = optionQesition;
    // map['savedId']  = savedId;
    // map['repostId']  = repostId;
    // map['likeId']  = likeId;
    // map['commentId']  = commentId;
    print('endToMap');
    return map;
  }
}