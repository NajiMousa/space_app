import 'package:flutter/material.dart';

import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../models/user_models/user_profile_data_model.dart';

class TagPeopleScreen extends StatefulWidget {
  @override
  _TagPeopleScreenState createState() => _TagPeopleScreenState();
}

class _TagPeopleScreenState extends State<TagPeopleScreen> {
  List<UserProfileDataModel>? _userData; // Load people from Firestore or another source
  final List<String> _selectedPeopleIds = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
  }
  Future<void> _loadUserData() async {
    List<UserProfileDataModel> userData = await FbFireStoreController().getAllUserData();
    print('001');
    setState(() {
      _userData = userData;
    //   _userProfileData = userData.firstWhere((user) => user.userDataId == SharedPrefController().userDataId) ;
    });
    print('002');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tag People')),
      body: ListView.builder(
        itemCount: _userData!.length,
        itemBuilder: (context, index) {
          final person = _userData![index];
          final isSelected = _selectedPeopleIds.contains(person.userDataId);

          return ListTile(
            title: Text(person.firstName+ ' '+ person.lastName),
            trailing: isSelected ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedPeopleIds.remove(person.userDataId);
                } else {
                  _selectedPeopleIds.add(person.userDataId);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Navigator.pop(context, _selectedPeopleIds);
        },
      ),
    );
  }
}