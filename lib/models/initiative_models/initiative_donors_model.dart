
class InitiativeDonorsModel {
  late String initiativeDonorId;
  late String userDataId;
  late String amount;
  late String timeStamp;
  late String initiativeId;


  InitiativeDonorsModel();

  InitiativeDonorsModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    initiativeDonorId = documentMap['initiativeDonorId'];
    initiativeId = documentMap['initiativeId'];
    amount = documentMap['amount'];
    timeStamp = documentMap['timeStamp'];
    userDataId = documentMap['userDataId'];

    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['initiativeDonorId'] = initiativeDonorId;
    map['initiativeId'] = initiativeId;
    map['amount'] = amount;
    map['timeStamp'] = timeStamp;
    map['userDataId'] = userDataId;
    print('endToMap');
    return map;
  }
}