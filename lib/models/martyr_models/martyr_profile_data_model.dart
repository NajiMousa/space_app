
class MartyrProfileDataModel {
  // late String id ;
  late String martyrDataId ;
  late String firstName ;
  late String lastName ;
  late String bio ;
  late String dateOfBirth ;
  late String userDataId ;
  late String martyrRequestDataId ;
  // late String gender ;
  late String backgroundImage ;
  late String profileImage ;

  MartyrProfileDataModel();

  MartyrProfileDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    martyrDataId = documentMap['martyrDataId'];
    firstName = documentMap['firstName'];
    print('01');
    lastName = documentMap['lastName'];
    print('02');
    bio = documentMap['bio'];
    print('03');
    dateOfBirth = documentMap['dateOfBirth'];
    userDataId = documentMap['userDataId'];
    martyrRequestDataId = documentMap['martyrRequestDataId'];
    print('04');
    // gender = documentMap['gender'];
    backgroundImage = documentMap['backgroundImage'];
    profileImage = documentMap['profileImage'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['martyrDataId'] = martyrDataId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['bio'] = bio;
    map['dateOfBirth'] = dateOfBirth;
    map['userDataId'] = userDataId;
    map['martyrRequestDataId'] = martyrRequestDataId;
    // map['gender'] = gender;
    map['backgroundImage'] = backgroundImage;
    map['profileImage'] = profileImage;
    print('endToMap');
    return map;
  }
}