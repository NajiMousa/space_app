// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
//
//
// class ChatProvider extends ChangeNotifier{
//   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
//
//   Stream<QuerySnapshot> getMessagesStream() {
//     return _fireStore.collection('messages').orderBy('timestamp', descending: true).snapshots();
//   }
//
//   Future<void> sendMessage(String text, String userId) async {
//     await _fireStore.collection('messages').add({
//       'text': text,
//       'userId': userId,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }
// }