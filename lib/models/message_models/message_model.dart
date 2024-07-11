
class MessageModel {
  late String messageId;
  late String userDataId;
  late String receiveID;
  late String content;
  late String timeStamp;
  late String conversationId;
  late bool isRead;
  late bool isSentByMe;

  MessageModel();

  MessageModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    conversationId = documentMap['conversationId'];
    userDataId = documentMap['userDataId'];
    receiveID = documentMap['receiveID'];
    messageId = documentMap['messageId'];
    content = documentMap['content'];
    timeStamp = documentMap['timeStamp'];
    isRead = documentMap['isRead'];
    isSentByMe = documentMap['isSentByMe'];

    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['conversationId'] = conversationId;
    map['userDataId'] = userDataId;
    map['receiveID'] = receiveID;
    map['messageId'] = messageId;
    map['content'] = content;
    map['timeStamp'] = timeStamp;
    map['isRead'] = isRead;
    map['isSentByMe'] = isSentByMe;
    print('endToMap');
    return map;
  }
}