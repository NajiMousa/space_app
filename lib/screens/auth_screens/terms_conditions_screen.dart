import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Last Updated:',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: HexColor('#8C9EA0'),
                        fontFamily: 'BreeSerif'),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '28May 2024',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: HexColor('#333333'),
                        fontFamily: 'BreeSerif'),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Welcome to the Commemoration of Martyrs and Victims Application (the Dafif Al-Wafa). By accessing or using our App, you agree to comply with and be bound by the following terms and conditions (the "Terms"). Please read these Terms carefully. If you do not agree to these Terms, you should Call us.',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Acceptance of Terms',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'By downloading, accessing, or using the App, you acknowledge that you have read, understood, and agree to be bound by these Terms and any other applicable laws and regulatio',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Eligibility',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'You must be at least 13 years old to use the App. By using the App, you represent and warrant that you meet this age requirement.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'User Accounts',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: HexColor('#D6E0E6'),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'To access certain features of the App, you may be required to create an account. You agree to:',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 7.h),
                              child: Text(
                                '- Provide accurate, current, and complete information during the registration process. \n - Maintain and update your account information to keep it accurate, current, and complete.  \n - Keep your password secure and not share it with others.  \n - Be responsible for all activities that occur under your account.',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'User Conduct',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: HexColor('#D6E0E6'),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'You agree to use the App in a manner that is lawful and respectful. You will not:',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 7.h),
                              child: Text(
                                '- Post or share any content that is illegal, harmful, threatening, abusive, harassing, defamatory, vulgar, obscene, or otherwise objectionable. \n - Impersonate any person or entity or falsely state or misrepresent your affiliation with a person or entity.  \n - Engage in any activity that interferes with or disrupts the App or the servers and networks connected to the App.  \n - Use the App for any commercial purposes without our prior written consent.',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Content',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'User-Generated Content: You are responsible for the content you post on the App. By posting content, you grant us a non-exclusive, worldwide, royalty-free, transferable, and sublicensable right to use, reproduce, modify, distribute, and display such content in connection with the operation and promotion of the App. \n Prohibited Content: You agree not to post content that violates any third-party rights or any applicable laws. This includes, but is not limited to, copyrighted material, trademarks, and other proprietary information without proper authorization.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Privacy',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'Your privacy is important to us. Please review our Privacy Policy, which explains how we collect, use, and protect your personal information. By using the App, you consent to our Privacy Policy.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Intellectual Property',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'Ownership: All content and materials on the App, including but not limited to text, graphics, logos, and software, are the property of the App or its licensors and are protected by intellectual property laws. \n License: You are granted a limited, non-exclusive, non-transferable, revocable license to use the App for personal, non-commercial use in accordance with these Terms.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Termination',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'We reserve the right to terminate or suspend your account and access to the App at any time, with or without cause, with or without notice. Upon termination, you must cease all use of the App and delete all copies of the App from your devices.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Disclaimers',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'The App is provided "as is" and "as available" without warranties of any kind, either express or implied. We do not warrant that the App will be uninterrupted or error-free.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Indemnification',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'You agree to indemnify, defend, and hold harmless the App and its affiliates, officers, directors, employees, and agents from any claims, liabilities, damages, losses, and expenses, including reasonable attorneys\' fees, arising out of or in any way connected with your use of the App or violation of these Terms.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Limitation of Liability',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: HexColor('#D6E0E6'),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'To the fullest extent permitted by law, we shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from:',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 7.h),
                              child: Text(
                                '- Your use of or inability to use the App.  \n - Any unauthorized access to or use of our servers and/or any personal information stored therein.',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Governing Law',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'These Terms shall be governed by and construed in accordance with the laws of the jurisdiction in which the App operates, without regard to its conflict of law principles.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Changes to Terms',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'We may modify these Terms at any time. When we do, we will revise the "Last Updated" date at the top of these Terms. You are responsible for regularly reviewing these Terms. Your continued use of the App following the posting of changes constitutes your acceptance of such changes.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#D6E0E6'),
                      ),
                      child: Text(
                        'If you have any questions about these Terms, please contact us at difaf_al-wafa@info.com.',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),

      ],
    );
  }
}
