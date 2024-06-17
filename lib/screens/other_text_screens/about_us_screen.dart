import 'package:difaf_al_wafa_app/screens/primary_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/app_text_field_widget.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Space',
            style: TextStyle(
                fontSize: 22.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
          SizedBox(height: 16),
          Text(
            'A dedicated platform preserving the memory of our martyrs. Our mission is to honor and remember those who have made the ultimate sacrifice for our nation. Through Space, we provide a respectful and enduring digital memorial where families and friends can share stories, photos, and tributes to keep the memories of their loved ones alive.',
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
          SizedBox(height: 24),
          Text(
            'Our Mission',
            style: TextStyle(
                fontSize: 22.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
          SizedBox(height: 16),
          Text(
            'Our mission is to create a space where the heroism and sacrifices of our martyrs are commemorated with dignity and respect. We aim to ensure that their legacies are preserved for future generations, providing a place for reflection, remembrance, and community support.',
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
          SizedBox(height: 24),
          Text(
            'What We Offer',
            style: TextStyle(
                fontSize: 22.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
          SizedBox(height: 16),
          Text(
            '• Digital Memorials: Personalized pages for each martyr with photos, stories, and tributes.\n'
                '• Community Support: A platform for families and friends to connect, share, and support each other.\n'
                '• Historical Records: Preservation of important historical records and testimonies.',
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
          SizedBox(height: 24),
          Text(
            'Contact Us',
            style: TextStyle(
                fontSize: 22.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
          SizedBox(height: 16),
          Text(
            'If you have any questions or need assistance, please do not hesitate to contact us at support@spaceapp.com. Together, we can ensure that the bravery and sacrifices of our martyrs are never forgotten.',
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
