
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/app_text_field_widget.dart';

class AddInitiativeScreen extends StatefulWidget {
  const AddInitiativeScreen({Key? key}) : super(key: key);

  @override
  State<AddInitiativeScreen> createState() => _AddInitiativeScreenState();
}

class _AddInitiativeScreenState extends State<AddInitiativeScreen> {

  bool hasAddedStory = false;
  bool isActive = true;
  bool isClickOnMoreIcon = false;

  final _formKey = GlobalKey<FormState>();

  // String _initiativeName = '';
  // String _classification = 'Health';
  // String _description = '';
  // double _targetAmount = 0.0;
  // String _mechanism = '';
  // String _responsiblePerson = '';

  // List<File> _documentationFiles = [];

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
                    SnackBar(
                        content: Text('Initiative Created')),
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
                'Create Initiative',
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
                              'Create New Initiative',
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

                          // AppTextFieldWidget(labelText: 'Ihsan',sectionTitle: 'Initiative Name'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Initiative Name'),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter the initiative name';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _initiativeName = value!;
                          //   },
                          // ),

                          // AppTextFieldWidget(labelText: 'Health',sectionTitle:'Classification' ),
                          // DropdownButtonFormField<String>(
                          //   value: _classification,
                          //   decoration: InputDecoration(labelText: 'Classification'),
                          //   items: ['Health', 'Other'].map((String classification) {
                          //     return DropdownMenuItem<String>(
                          //       value: classification,
                          //       child: Text(classification),
                          //     );
                          //   }).toList(),
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       _classification = newValue!;
                          //     });
                          //   },
                          // ),

                          // AppTextFieldWidget(labelText: 'your initiative Bio',sectionTitle: 'Description'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Description'),
                          //   maxLines: 3,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter a description';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _description = value!;
                          //   },
                          // ),

                          // AppTextFieldWidget(labelText: '1000 Dollar',sectionTitle: 'Target Amount (USD)'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Target Amount (USD)'),
                          //   keyboardType: TextInputType.number,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter the target amount';
                          //     }
                          //     if (double.tryParse(value) == null) {
                          //       return 'Please enter a valid amount';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _targetAmount = double.parse(value!);
                          //   },
                          // ),

                          // AppTextFieldWidget(labelText: 'Mechanism of Work', sectionTitle: 'Mechanism of Work'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Mechanism of Work'),
                          //   maxLines: 3,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter the mechanism of work';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _mechanism = value!;
                          //   },
                          // ),

                          // AppTextFieldWidget(labelText: 'Responsible Person', sectionTitle: 'Responsible Person'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Responsible Person'),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter the responsible person\'s name';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _responsiblePerson = value!;
                          //   },
                          // ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              'Documentation Files',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                            child: Wrap(
                              spacing: 10,
                              children: [
                                // ..._documentationFiles.map((file) => Image.file(file, width: 100, height: 100)),
                                GestureDetector(
                                  // onTap: _pickDocument,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[300],
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
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

