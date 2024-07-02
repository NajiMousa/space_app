
class UserProfileDataModel {
  // late String id ;
  late String userDataId ;
  late String firstName ;
  late String lastName ;
  late String bio ;
  late String dateOfBirth ;
  late String userIdRegistration ;
  // late String gender ;
  late String backgroundImage ;
  late String profileImage ;

  UserProfileDataModel();

  UserProfileDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    print('startForm');
    userDataId = documentMap['userDataId'];
    firstName = documentMap['firstName'];
    print('01');
    lastName = documentMap['lastName'];
    print('02');
    bio = documentMap['bio'];
    print('03');
    dateOfBirth = documentMap['dateOfBirth'];
    userIdRegistration = documentMap['userIdRegistration'];
    print('04');
    // gender = documentMap['gender'];
    backgroundImage = documentMap['backgroundImageUrl'];
    profileImage = documentMap['profileImageUrl'];
    print('endForm');
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['userDataId'] = userDataId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['bio'] = bio;
    map['dateOfBirth'] = dateOfBirth;
    map['userIdRegistration'] = userIdRegistration;
    // map['gender'] = gender;
    map['backgroundImageUrl'] = backgroundImage;
    map['profileImageUrl'] = profileImage;
    print('endToMap');
    return map;
  }
}