import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/message_models/conversation_model.dart';
import 'package:difaf_al_wafa_app/models/message_models/message_model.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/widgets/show_more_action_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:uuid/uuid.dart';

import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../models/user_models/user_profile_data_model.dart';

class SingleMessangerScreen extends StatefulWidget {
  SingleMessangerScreen({Key? key, this.conversationModel, this.userProfileDataModel}) : super(key: key);

  ConversationModel? conversationModel;
  UserProfileDataModel? userProfileDataModel;

  @override
  State<SingleMessangerScreen> createState() => _SingleMessangerScreenState();
}

class _SingleMessangerScreenState extends State<SingleMessangerScreen> {
  late TextEditingController _messageTextEditingController;
  var uuid = Uuid();
  bool noData = false;
  // bool firstMessage = false;
  UserProfileDataModel? _userProfileData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
    _messageTextEditingController = TextEditingController();
  }

  Future<void> _loadUserData() async {
    List<UserProfileDataModel> userData = await FbFireStoreController().getAllUserData();
    List<ConversationModel> conversationData = await FbFireStoreController().getAllConversationData();
    setState(() {
      widget.userProfileDataModel == null ? _userProfileData = userData.firstWhere((user) => user.userDataId == conversationData.first.receiveID) :null ;
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _messageTextEditingController.dispose();
    super.dispose();
  }

  bool isClickOnMoreIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: isClickOnMoreIcon
          ? null
          : SingleChildScrollView(
              child: Container(
                height: 72.0, // Set the height here
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
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
                              controller: _messageTextEditingController,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 11.sp,
                                color: HexColor('#8C9EA0'),
                              ),
                              maxLines: 1,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: AppLocalizations.of(context)!
                                    .writeYourMassage,
                                labelStyle: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 11.sp,
                                  color: HexColor('#8C9EA0'),
                                ),
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
                        onTap: () async => await performProcess(),
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
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.sp)
                              ),
                              clipBehavior: Clip.antiAlias,
                              width: 40.w,
                              height: 40.w,
                              child: CachedNetworkImage(
                                imageUrl: widget.userProfileDataModel != null ? widget.userProfileDataModel!.profileImageUrl: _userProfileData!.profileImageUrl,
                                width: 40.w,
                                height: 40.w,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder: (context, url, downloadProgress) =>
                                    CircularProgressIndicator(value: downloadProgress.progress),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.userProfileDataModel != null ? widget.userProfileDataModel!.firstName + ' ' + widget.userProfileDataModel!.lastName : _userProfileData!.firstName + ' ' + _userProfileData!.lastName,
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
                                padding:
                                    EdgeInsets.only(left: 12.w, right: 6.w),
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
                                padding:
                                    EdgeInsets.only(left: 12.w, right: 6.w),
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
                                padding:
                                    EdgeInsets.only(left: 12.w, right: 6.w),
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
                StreamBuilder<QuerySnapshot>(
                  stream: FbFireStoreController().readMessage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                      List<QueryDocumentSnapshot> document =
                          snapshot.data!.docs;
                      return Expanded(
                        child: ListView.builder(
                          reverse: true,
                          padding: EdgeInsets.all(8.0),
                          itemCount: document.length,
                          itemBuilder: (context, index) {
                            // final message = _messages[index];
                            return ChatBubble(
                              message: document[index].get('content'),
                              isSentByMe: SharedPrefController().userDataId == document[index].get('receiveID') ? true : false,
                              userProfileData: widget.userProfileDataModel == null ? _userProfileData : widget.userProfileDataModel,
                            );
                          },
                        ),
                      );
                    } else {
                      // setState(() {
                        noData = true;
                      // });
                      return Center(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.signal_cellular_nodata,
                              size: 85,
                            ),
                            Text('No Data'),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          isClickOnMoreIcon
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isClickOnMoreIcon = false;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    color: HexColor('#333333').withOpacity(0.7),
                  ),
                )
              : SizedBox(),
          isClickOnMoreIcon ? ShowMoreActionMessageWidget() : SizedBox(),
        ],
      ),
    );
  }
  Future<void> performProcess() async {
    if (checkData()) {
      await process();
    }
  }

  bool checkData() {
    if (_messageTextEditingController.text.isNotEmpty ) {
      ///showSnackBar(context : context , message : 'Enter required Data', error : true);
      return true;
    }
    return false;
  }

  Future<void> process() async {

    bool status =  await FbFireStoreController().createMessage(messageModel: messageModel);
    if (status) {
      if(noData){
        noData = false;
        await FbFireStoreController().createConversation(conversationModel: widget.conversationModel!);
        clear();
      }
      else{
        clear();
      }
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  MessageModel get messageModel {
    MessageModel messageModel = MessageModel();
    messageModel.messageId = uuid.v4();
    messageModel.userDataId = SharedPrefController().userDataId;
    messageModel.receiveID = widget.userProfileDataModel == null ? _userProfileData!.userDataId : widget.userProfileDataModel!.userDataId;
    messageModel.conversationId = widget.conversationModel!.conversationId;
    messageModel.content = _messageTextEditingController.text;
    messageModel.timeStamp = DateTime.now().toString();
    messageModel.isRead = false;
    return messageModel;
  }

  void clear(){
    _messageTextEditingController.text = '';
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  final UserProfileDataModel? userProfileData;

  const ChatBubble({required this.message, required this.isSentByMe, required this.userProfileData});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.sp)
              ),
              clipBehavior: Clip.antiAlias,
              width: 32.w,
              height: 32.w,
              child: CachedNetworkImage(
                imageUrl: userProfileData!.profileImageUrl,
                width: 32.w,
                height: 32.w,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
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

// FbFireStoreController
// ().createConversation
// (
// conversationModel
// :
// conversationModel
// );
