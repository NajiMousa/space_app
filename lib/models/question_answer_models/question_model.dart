
class LikesModel {
  late String questionId;
  late String questionText;
  late List<String> options;

  LikesModel();

  LikesModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    questionId = documentMap['questionId'];
    questionText = documentMap['questionText'];
    options = documentMap['options'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['questionId'] = questionId;
    map['questionText'] = questionText;
    map['options'] = options;
    print('endToMap');
    return map;
  }
}