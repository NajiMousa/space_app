import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/app_text_field_widget.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({Key? key}) : super(key: key);

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  bool hasAddedStory = false;
  bool isActive = true;
  bool isClickOnMoreIcon = false;



  final _formKey = GlobalKey<FormState>();

  // String _groupName = '';
  // String _description = '';
  // String _groupType = 'Public';
  // PickedFile? _groupPhoto;
  //
  // final ImagePicker _picker = ImagePicker();
  //
  // Future<void> _pickImage() async {
  //   final pickedFile = await _picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _groupPhoto = pickedFile;
  //   });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: HexColor('#333333'),
        bottomNavigationBar: Container(
          height: 72.0, // Set the height here
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Handle save logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Initiative Created')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                minimumSize: Size(double.infinity, 56.h),
                backgroundColor: HexColor('#FFFFFF'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.sp),
                ),
              ),
              child: Text(
                'Create Group',
                style: TextStyle(
                  color: HexColor('#333333'),
                  fontSize: 16.sp,
                  fontFamily: 'BreeSerif',
                ),
              ),
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: AppBar(
              elevation: 0,
              backgroundColor: HexColor('#FFFFFF'),
              flexibleSpace: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SvgPicture.asset('images/icons/icons.png'),
                      Container(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'images/arrow_back.svg',
                                width: 10.w,
                                height: 16.h,
                                color: HexColor('#333333'),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text(
                              'Create New Group',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 60.w),
                    ],
                  ),
                ),
              )),
        ),
        body: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(42.sp),
                      bottomRight: Radius.circular(42.sp),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          SizedBox(height: 100.h),
                      Center(
                        child: GestureDetector(
                          // onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 90,
                            // backgroundImage: _groupPhoto == null
                            //     ? AssetImage('assets/group_placeholder.png')
                            //     : FileImage(File(_groupPhoto!.path)),
                            // child: _groupPhoto == null
                            //     ? Icon(Icons.camera_alt, size: 50)
                            //     : Container(),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),

                      // AppTextFieldWidget(
                      //     labelText: 'Flutter', sectionTitle: 'Group Name'),
                      // TextFormField(
                      //   decoration: InputDecoration(labelText: 'Group Name'),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter the group name';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _groupName = value!;
                      //   },
                      // ),
                      //
                      // AppTextFieldWidget(
                      //     labelText: 'Group Bio',
                      //     sectionTitle: 'Description'),
                      // AppTextFieldWidget(labelText: 'Description'),

                      // AppTextFieldWidget(
                      //     labelText: 'Group Type',
                      //     sectionTitle: 'Group Type'),
                      // DropdownButtonFormField<String>(
                      //   value: _groupType,
                      //   decoration: InputDecoration(labelText: 'Group Type'),
                      //   items: ['Public', 'Private'].map((String type) {
                      //     return DropdownMenuItem<String>(
                      //       value: type,
                      //       child: Text(type),
                      //     );
                      //   }).toList(),
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       _groupType = newValue!;
                      //     });
                      //   },
                      // ),
                      SizedBox(height: 50),

                        ],
                      ),
                    ),
                  ),
                  // _primaryPageModel[_selectedIndex].widget,
                ),
              ],
            ),
            // _selectedDrawer == 8 ? _primaryPageModel[_selectedDrawer].widget : SizedBox()
          ],
        ),
      ),
    );
  }
}






