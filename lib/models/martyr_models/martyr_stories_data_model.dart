
class MartyrStoriesDataModel {

  late String martyrDataId ;
  late String martyrStoryId ;
  late String content ;
  late String userDataId ;
  late String timeStamp ;

  MartyrStoriesDataModel();

  MartyrStoriesDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    martyrDataId = documentMap['martyrDataId'];
    martyrStoryId = documentMap['martyrStoryId'];
    print('01');
    content = documentMap['content'];
    print('02');
    timeStamp = documentMap['timeStamp'];
    userDataId = documentMap['userDataId'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');

    Map<String ,dynamic> map = <String ,dynamic> {};
    map['martyrDataId'] = martyrDataId;
    map['martyrStoryId'] = martyrStoryId;
    map['content'] = content;
    map['timeStamp'] = timeStamp;
    map['userDataId'] = userDataId;
    print('endToMap');
    return map;
  }
}