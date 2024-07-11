
class CandleModel {
  late String candleId;
  late String candlePersonId;
  late String martyrDataId;
  late String timestamp;

  CandleModel();

  CandleModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    candleId = documentMap['candleId'];
    candlePersonId = documentMap['candlePersonId'];
    martyrDataId = documentMap['martyrDataId'];
    timestamp = documentMap['timestamp'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['candleId'] = candleId;
    map['candlePersonId'] = candlePersonId;
    map['martyrDataId'] = martyrDataId;
    map['timestamp']  = timestamp;

    print('endToMap');
    return map;
  }
}