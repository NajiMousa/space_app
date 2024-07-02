import '../../../prefs/shared_pref_controller.dart';

class UsersRegisterationModel {

  // late String id;
  late String usersRegisterationId;
  late String userAuthId;
  late String email;
  late String password;
  late String phone;


  // UsersRegisterationModel();
  UsersRegisterationModel({required this.phone, required this.password, required this.email, required this.usersRegisterationId,  required this.userAuthId});

  UsersRegisterationModel.fromJson(Map<String ,dynamic> documentMap ){
    usersRegisterationId = documentMap['usersRegisterationId'];
    userAuthId = documentMap['userAuthId'];
    email = documentMap['email'];
    password = documentMap['password'];
    phone = documentMap['phone'];
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['usersRegisterationId'] = usersRegisterationId;
    map['userAuthId'] = userAuthId;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    print('endToMap');
    return map;
  }
}