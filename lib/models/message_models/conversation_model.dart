
class ConversationModel {
  late String conversationId;
  late String userDataId;
  late String receiveID;

  ConversationModel();

  ConversationModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    conversationId = documentMap['conversationId'];
    userDataId = documentMap['userDataId'];
    receiveID = documentMap['receiveID'];

    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['conversationId'] = conversationId;
    map['userDataId'] = userDataId;
    map['receiveID'] = receiveID;
    print('endToMap');
    return map;
  }
}