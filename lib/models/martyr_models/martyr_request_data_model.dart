
class MartyrRequestDataModel {
  // late String martyrRequestId ;
  late String firstIdentifiersPhoneNumber;
  late String firstIdentifiersIDNumber;
  late String dateOfBirthMartyr;
  late String martyrIdNumber;
  late String fullMartyrName;
  late String deathCertificate;
  late String placeOfMartyrdom;
  late String dateOfMartyrdom;
  late String userPhoneNumber;
  late String userIDNumber;
  late String fullUserName;
  late String fullFirstIdentifiersName;
  late String userIDCertificate;
  late String status;
  late String userDataId;
  late String martyrRequestId;


  MartyrRequestDataModel();

  MartyrRequestDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    // martyrRequestId  = documentMap['martyrRequestId'];
    firstIdentifiersPhoneNumber = documentMap['firstIdentifiersPhoneNumber'];
    firstIdentifiersIDNumber = documentMap['firstIdentifiersIDNumber'];
    dateOfBirthMartyr = documentMap['dateOfBirthMartyr'];
    martyrIdNumber = documentMap['martyrIdNumber'];
    fullMartyrName = documentMap['fullMartyrName'];
    deathCertificate = documentMap['deathCertificate'];
    placeOfMartyrdom = documentMap['placeOfMartyrdom'];
    dateOfMartyrdom = documentMap['dateOfMartyrdom'];
    userPhoneNumber = documentMap['userPhoneNumber'];
    userIDNumber = documentMap['userIDNumber'];
    fullUserName = documentMap['fullUserName'];
    fullFirstIdentifiersName = documentMap['fullFirstIdentifiersName'];
    userIDCertificate = documentMap['userIDCertificate'];
    status = documentMap['status'];
    userDataId = documentMap['userDataId'];
    martyrRequestId = documentMap['martyrRequestId'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    // map['martyrRequestId '] = martyrRequestId;
    map['firstIdentifiersPhoneNumber'] = firstIdentifiersPhoneNumber;
    map['firstIdentifiersIDNumber'] = firstIdentifiersIDNumber;
    map['dateOfBirthMartyr'] = dateOfBirthMartyr;
    map['martyrIdNumber'] = martyrIdNumber;
    map['fullMartyrName'] = fullMartyrName;
    map['deathCertificate'] = deathCertificate;
    map['placeOfMartyrdom'] = placeOfMartyrdom;
    map['dateOfMartyrdom'] = dateOfMartyrdom;
    map['userPhoneNumber'] = userPhoneNumber;
    map['userIDNumber'] = userIDNumber;
    map['fullUserName'] = fullUserName;
    map['fullFirstIdentifiersName'] = fullFirstIdentifiersName;
    map['userIDCertificate'] = userIDCertificate;
    map['status'] = status;
    map['userDataId'] = userDataId;
    map['martyrRequestId'] = martyrRequestId;
    print('endToMap');
    return map;
  }
}