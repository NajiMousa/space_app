import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTextFieldWidget extends StatelessWidget {
  AppTextFieldWidget({Key? key, required this.labelText ,required this.sectionTitle}) : super(key: key);

  String labelText;
  String sectionTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 6.h),
            child: Text(
              sectionTitle,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: HexColor('#333333'),
                  fontFamily: 'BreeSerif'),
            ),
          ),
          // AppTextFieldWidget(labelText: 'Description'),
          TextFormField(
            // maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
            onSaved: (value) {
              labelText = value!;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: labelText,
              labelStyle: TextStyle(
                fontFamily: 'BreeSerif',
                fontSize: 12.sp,
                color: HexColor('#999999'),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor('#333333'), width: 1.w),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor('#333333'), width: 1.w),
                borderRadius: BorderRadius.circular(15.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: BorderSide(
                    color: HexColor('#333333')
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
//
// import 'package:flutter/material.dart';
//
// class AppTextField extends StatelessWidget {
//   final TextEditingController textEditingController;
//   final TextInputType textInputType;
//   final Color fontColor;
//   final IconData prefixIcon;
//   final IconData? suffixIcon;
//   final String? errorText;
//   final String hint;
//   final bool obsecure;
//
//   AppTextField({
//     required this.textEditingController ,
//     this.textInputType = TextInputType.text,
//     this.fontColor = Colors.grey,
//     required this.prefixIcon,
//     required this.hint,
//     required this.obsecure,
//     this.suffixIcon,
//     this.errorText ='',
//     t
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: textEditingController,
//       keyboardType: textInputType,
//       // maxLength: 45,
//       // buildCounter: (context,
//       //     {required int currentLength,
//       //     required bool isFocused,
//       //     maxLength}) {
//       //   return Text('1:45');
//       // },
//
//       // readOnly: true,
//
//       onTap: () {
//         print('');
//       },
//
//       textCapitalization: TextCapitalization.characters,
//
//       minLines: 1,
//       // maxLines: 3,
//
//       style: TextStyle(color: Colors.grey),
//       showCursor: false,
//       cursorWidth: 5,
//       cursorColor: Colors.pink,
//
//       onChanged: (value) {},
//       obscureText: obsecure,
//       decoration: InputDecoration(
//         constraints: BoxConstraints(minHeight: 0, maxHeight: 80),
//
//         contentPadding: EdgeInsetsDirectional.zero,
//         // contentPadding: EdgeInsetsDirectional.symmetric(),
//
//         // counterText: '',
//         hintText: errorText,
//         hintMaxLines: 1,
//         hintStyle: TextStyle(
//           color: fontColor,
//         ),
//         labelText: 'Email',
//         labelStyle: TextStyle(
//           color: fontColor,
//         ),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         floatingLabelStyle: TextStyle(
//           color: fontColor,
//         ),
//
//         // fillColor: Colors.orange,
//         filled: true,
//
//         prefixIcon: Icon(
//             prefixIcon
//         ),
//         prefixText: 'ucas_',
//         // prefix: Icon(Icons.email),
//         prefixStyle: TextStyle(color: Colors.red),
//
//         suffixIcon: Icon(suffixIcon),
//         suffixStyle: TextStyle(color: Colors.black26),
//         suffixText: 'ucas.ps',
//
//         // enabled: false,
//         // disabledBorder: InputBorder.none,
//         // disabledBorder: UnderlineInputBorder(
//         //   borderSide: BorderSide(
//         //     color: Colors.red,
//         //     width: 5,
//         //   ),
//         //   borderRadius: BorderRadius.circular(10),
//         // ),
//         disabledBorder: getBorder(),
//         enabledBorder:getBorder(borderColor: Colors.blue),
//
//         helperText: 'naji@gmail.com',
//         helperStyle: TextStyle(color: Colors.red),
//         helperMaxLines: 1,
//
//         errorBorder: getBorder(borderColor: Colors.red),
//         errorMaxLines: 1,
//         errorText: errorText,
//
//
//       ),
//     );
//   }
//
//   OutlineInputBorder getBorder ({Color borderColor = Colors.grey}){
//     return OutlineInputBorder(
//       borderSide: BorderSide(
//         color: borderColor,
//         width: 1,
//       ),
//       borderRadius: BorderRadius.circular(10),
//     );
//   }
// }
//
