
class ArticleDataModel {
  late String articleId;
  late String articleTitle;
  late String articleDetails;
  late String articlePublisher;
  late String yearOfPublication;
  late String placeOfPublication;
  late String backgroundImage;
  late String timeStamp;

  ArticleDataModel();

  ArticleDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    articleId = documentMap['articleId'];
    articleTitle = documentMap['articleTitle'];
    articleDetails = documentMap['articleDetails'];
    articlePublisher = documentMap['articlePublisher'];
    yearOfPublication = documentMap['yearOfPublication'];
    placeOfPublication = documentMap['placeOfPublication'];
    backgroundImage = documentMap['backgroundImage'];
    timeStamp = documentMap['timeStamp'];

    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['articleId'] = articleId;
    map['articleTitle'] = articleTitle;
    map['articleDetails'] = articleDetails;
    map['articlePublisher'] = articlePublisher;
    map['yearOfPublication'] = yearOfPublication;
    map['placeOfPublication'] = placeOfPublication;
    map['backgroundImage'] = backgroundImage;
    map['timeStamp'] = timeStamp;
    print('endToMap');
    return map;
  }
}