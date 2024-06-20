import 'package:difaf_al_wafa_app/screens/widgets/show_more_action_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SingleMessangerScreen extends StatefulWidget {
  SingleMessangerScreen({Key? key}) : super(key: key);


  @override
  State<SingleMessangerScreen> createState() => _SingleMessangerScreenState();
}

class _SingleMessangerScreenState extends State<SingleMessangerScreen> {
  // final List<Message> _messages = [];
  // final TextEditingController _controller = TextEditingController();
  //
  // void _sendMessage(String text) {
  //   if (text.isEmpty) return;
  //   final message = Message(text: text, isSentByMe: true);
  //   setState(() {
  //     _messages.add(message);
  //   });
  //   _controller.clear();
  //   // Simulate receiving a reply
  //   Future.delayed(Duration(seconds: 1), () {
  //     final reply = Message(text: "Reply to: $text", isSentByMe: false);
  //     setState(() {
  //       _messages.add(reply);
  //     });
  //   });

  bool isClickOnMoreIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: isClickOnMoreIcon ? null :SingleChildScrollView(
        child: Container(
          height: 72.0, // Set the height here
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    'images/face_smile_wink_icon.svg',
                    height: 24.h,
                    width: 24.w,
                    color: HexColor('#FFFFFF'),
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 12.w),
                      alignment: AlignmentDirectional.center,
                      width: 180.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.sp),
                      ),
                      child: TextField(
                        // controller: widget.textEditingController,
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 11.sp,
                          color: HexColor('#8C9EA0'),
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: AppLocalizations.of(context)!.writeYourMassage,
                          enabledBorder: getBorder(),
                          focusedBorder: getBorder(),
                        ),
                      )),
                ),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: SvgPicture.asset(
                      'images/microphone_icon.svg',
                      height: 20.h,
                      width: 20.w,
                      color: HexColor('#FFFFFF'),
                    ),
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: SvgPicture.asset(
                      'images/gallery_icon.svg',
                      height: 20.h,
                      width: 20.w,
                      color: HexColor('#FFFFFF'),
                    ),
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: SvgPicture.asset(
                      'images/attachment_icon.svg',
                      height: 20.h,
                      width: 20.w,
                      color: HexColor('#FFFFFF'),
                    ),
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 6.w),
                    child: SvgPicture.asset(
                      'images/messengerIcon.svg',
                      height: 20.h,
                      width: 20.w,
                      color: HexColor('#FFFFFF'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 32.w, right: 24.w, top: 63.h, bottom: 18.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                              width: 18.w,
                            ),
                            Image.asset(
                              'images/userIcon.png',
                              width: 40.w,
                              height: 40.w,
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mohammed Yusef',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.onlineNow,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: HexColor('#6699CC'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                print('object');
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.w, right: 6.w),
                                child: SvgPicture.asset(
                                  'images/callPhone.svg',
                                  height: 24.h,
                                  width: 24.w,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ),
                            InkWell(
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.w, right: 6.w),
                                child: SvgPicture.asset(
                                  'images/video call_camera.svg',
                                  height: 24.h,
                                  width: 24.w,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isClickOnMoreIcon = true;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.w, right: 6.w),
                                child: SvgPicture.asset(
                                  'images/icons.svg',
                                  height: 18.h,
                                  width: 18.w,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.all(8.0),
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      // final message = _messages[index];
                      return ChatBubble(
                        message: 'message.text',
                        isSentByMe: true,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        isClickOnMoreIcon ? InkWell(
            onTap: () {
              setState(() {
                isClickOnMoreIcon = false;
              });
            },
            child: Container(
              width: double.infinity,
              color: HexColor('#333333').withOpacity(0.7),
            ),
          ): SizedBox(),
          isClickOnMoreIcon ? ShowMoreActionMessageWidget(): SizedBox(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatBubble({required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: Row(
          children: [
            Image.asset(
              'images/userIcon.png',
              width: 24.w,
              height: 24.w,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              margin: EdgeInsets.only(bottom: 5.h, top: 5.h, left: 6.w),
              decoration: BoxDecoration(
                color: isSentByMe ? HexColor('#D6E0E6') : HexColor('#E0EBF2'),
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: Text(
                message,
                style: TextStyle(
                    fontSize: 11.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder getBorder({Color borderColor = Colors.white}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(50),
  );
}

class Message {
  final String text;
  final bool isSentByMe;

  Message({required this.text, required this.isSentByMe});
}
