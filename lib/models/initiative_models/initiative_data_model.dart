
class InitiativeDataModel {
  late String initiativeId;
  late String initiativeName;
  late String classification;
  late String description;
  late String targetAmount;
  late String mechanismOfWork;
  late String responsiblePerson;
  late String userDataId;
  late String backgroundImage;

  InitiativeDataModel();

  InitiativeDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    initiativeId = documentMap['initiativeId'];
    initiativeName = documentMap['initiativeName'];
    classification = documentMap['classification'];
    description = documentMap['description'];
    targetAmount = documentMap['targetAmount'];
    mechanismOfWork = documentMap['mechanismOfWork'];
    responsiblePerson = documentMap['responsiblePerson'];
    userDataId = documentMap['userDataId'];
    backgroundImage = documentMap['backgroundImage'];

    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['initiativeId'] = initiativeId;
    map['initiativeName'] = initiativeName;
    map['classification'] = classification;
    map['description'] = description;
    map['targetAmount'] = targetAmount;
    map['mechanismOfWork'] = mechanismOfWork;
    map['responsiblePerson'] = responsiblePerson;
    map['userDataId'] = userDataId;
    map['backgroundImage'] = backgroundImage;
    print('endToMap');
    return map;
  }
}