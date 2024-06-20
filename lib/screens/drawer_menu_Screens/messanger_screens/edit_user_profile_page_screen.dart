import 'package:difaf_al_wafa_app/screens/widgets/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class EditUserProfilePageScreen extends StatefulWidget {
  const EditUserProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<EditUserProfilePageScreen> createState() =>
      _EditUserProfilePageScreenState();
}

class _EditUserProfilePageScreenState extends State<EditUserProfilePageScreen> {
  bool hasAddedStory = false;
  bool isActive = true;
  bool isClickOnMoreIcon = false;

  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _bio = '';
  String _phoneNumber = '';
  DateTime _dateOfBirth = DateTime(2000, 1, 1);

  // PickedFile? _profileImage;
  //
  // final ImagePicker _picker = ImagePicker();
  //
  // Future<void> _pickImage() async {
  //   final pickedFile = await _picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _profileImage = pickedFile;
  //   });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: HexColor('#333333'),
        bottomNavigationBar: Container(
          height: 72.0, // Set the height here
          child:Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w, vertical: 16.h),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Handle save logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Profile Updated')),
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
                AppLocalizations.of(context)!.save,
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
                              AppLocalizations.of(context)!.editProfile,
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
                  child: ListView(
                    // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    children: [
                      SizedBox(height: 20.h),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: GestureDetector(
                                // onTap: _pickImage,
                                child: CircleAvatar(
                                  radius: 50,
                                  // backgroundImage: _profileImage == null
                                  // ? AssetImage('assets/profile_placeholder.png')
                                  //     : FileImage(File(_profileImage!.path)),
                                  // child: _profileImage == null
                                  // ? Icon(Icons.camera_alt, size: 50)
                                  //     : Container(),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 6.h),
                              child: Text(
                                AppLocalizations.of(context)!.name,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                            // AppTextFieldWidget(labelText: AppLocalizations.of(context)!.name,sectionTitle: AppLocalizations.of(context)!.name),
                            // TextFormField(
                            //   decoration: InputDecoration(labelText: 'Name'),
                            //   initialValue: _name,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Please enter your name';
                            //     }
                            //     return null;
                            //   },
                            //   onSaved: (value) {
                            //     _name = value!;
                            //   },
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 6.h),
                              child: Text(
                                AppLocalizations.of(context)!.email,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                            // AppTextFieldWidget(labelText: AppLocalizations.of(context)!.email,sectionTitle: AppLocalizations.of(context)!.email),
                            // TextFormField(
                            //   decoration: InputDecoration(labelText: 'Email'),
                            //   initialValue: _email,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Please enter your email';
                            //     }
                            //     return null;
                            //   },
                            //   onSaved: (value) {
                            //     _email = value!;
                            //   },
                            // ),

                            // AppTextFieldWidget(labelText: AppLocalizations.of(context)!.bio,sectionTitle: AppLocalizations.of(context)!.bio),
                            // TextFormField(
                            //   decoration: InputDecoration(labelText: 'Bio'),
                            //   initialValue: _bio,
                            //   maxLines: 3,
                            //   onSaved: (value) {
                            //     _bio = value!;
                            //   },
                            // ),

                            // AppTextFieldWidget(labelText: AppLocalizations.of(context)!.phone,sectionTitle: AppLocalizations.of(context)!.phone),
                            // TextFormField(
                            //   decoration:
                            //       InputDecoration(labelText: 'Phone Number'),
                            //   initialValue: _phoneNumber,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Please enter your phone number';
                            //     }
                            //     return null;
                            //   },
                            //   onSaved: (value) {
                            //     _phoneNumber = value!;
                            //   },
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 6.h),
                              child: Text(
                                AppLocalizations.of(context)!.dateOfBirth,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Date of Birth: ${_dateOfBirth.toLocal()}'
                                          .split(' ')[0],
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  TextButton(
                                    child: Text(
                                      AppLocalizations.of(context)!.selectDate,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.blue,
                                          fontFamily: 'BreeSerif'),
                                    ),
                                    onPressed: () async {
                                      DateTime? picked = await showDatePicker(
                                        context: context,
                                        initialDate: _dateOfBirth,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      );
                                      if (picked != null &&
                                          picked != _dateOfBirth)
                                        setState(() {
                                          _dateOfBirth = picked;
                                        });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),

                          ],
                        ),
                      )
                    ],
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
