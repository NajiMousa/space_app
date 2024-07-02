
class GroupMembersModel {
  late String groupMemberId;
  late String userDataId;
  late String timeStamp;
  late String groupId;


  GroupMembersModel();

  GroupMembersModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    groupId = documentMap['groupId'];
    groupMemberId = documentMap['groupMemberId'];
    timeStamp = documentMap['timeStamp'];
    userDataId = documentMap['userDataId'];

    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['groupId'] = groupId;
    map['groupMemberId'] = groupMemberId;
    map['timeStamp'] = timeStamp;
    map['userDataId'] = userDataId;
    print('endToMap');
    return map;
  }
}