
class GroupDataModel {
  late String groupId;
  late String groupName;
  late String groupBio;
  late String groupType;
  late String userDataId;
  late int groupMembersCount;
  late String backgroundImage;

  GroupDataModel();

  GroupDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    groupId = documentMap['groupId'];
    groupName = documentMap['groupName'];
    groupBio = documentMap['groupBio'];
    groupType = documentMap['groupType'];
    userDataId = documentMap['userDataId'];
    groupMembersCount = documentMap['groupMembersCount'];
    backgroundImage = documentMap['backgroundImage'];

    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['groupId'] = groupId;
    map['groupName'] = groupName;
    map['groupBio']  = groupBio;
    map['groupType'] = groupType;
    map['userDataId'] = userDataId;
    map['groupMembersCount'] = groupMembersCount;
    map['backgroundImage'] = backgroundImage;
    print('endToMap');
    return map;
  }
}