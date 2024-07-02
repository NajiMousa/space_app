import 'package:difaf_al_wafa_app/screens/add_new_screens/add_initiative_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/initiative_models/initiative_data_model.dart';

class InitiativeDetailsPage extends StatelessWidget {

  InitiativeDataModel initiativeDataModel;

  InitiativeDetailsPage({
    required this.initiativeDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Initiative Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              initiativeDataModel.initiativeName,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              initiativeDataModel.classification,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              initiativeDataModel.description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Target Amount:',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  initiativeDataModel.targetAmount,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(
              'Mechanism of Work:',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              initiativeDataModel.mechanismOfWork,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Responsible Person:',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              initiativeDataModel.responsiblePerson,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
              child: ElevatedButton(
                onPressed: () async {
                  print('object');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddInitiativeScreen(initiativeDataModel: initiativeDataModel,);
                  },));
                },
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                  minimumSize: Size(double.infinity, 56.h),
                  backgroundColor: HexColor('#333333'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    'edit',
                    style: TextStyle(
                      color: HexColor('#FFFFFF'),
                      fontSize: 16.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}