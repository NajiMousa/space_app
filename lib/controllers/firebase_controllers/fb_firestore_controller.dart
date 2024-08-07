import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/collecter_models/follow_model.dart';
import 'package:difaf_al_wafa_app/models/article_models/article_data_model.dart';
import 'package:difaf_al_wafa_app/models/martyr_models/martyr_request_data_model.dart';
import 'package:difaf_al_wafa_app/models/strory_models/story_data_model.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import '../../models/martyr_models/martyr_stories_data_model.dart';
import '../../models/message_models/conversation_model.dart';
import '../../models/group_models/group_data_model.dart';
import '../../models/message_models/message_model.dart';
import '../../models/initiative_models/initiative_data_model.dart';
import '../../models/martyr_models/martyr_profile_data_model.dart';
import '../../models/post_models/comments_model.dart';
import '../../models/post_models/likes_model.dart';
import '../../models/post_models/posts_model.dart';
import '../../models/post_models/reposts_model.dart';
import '../../models/post_models/saved_model.dart';
import '../../models/user_models/user_profile_data_model.dart';
import '../../models/user_models/users_registeration_model.dart';

class FbFireStoreController {
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;


  // Future<void> addUser(String uid, Users users) async {
  //   try {
  //     print('02');
  //     await _firebaseFireStore
  //         .collection('users')
  //         .doc(uid)
  //         .set(users.toMap())
  //         .then((value) => true)
  //         .catchError((error) => false);
  //     print('03');
  //   } catch (e) {
  //     print("Error adding user: $e");
  //   }
  // }

  ///  UserRegisterationModel

  Future<void> addUser({required UsersRegisterationModel userRegisterationModel}) async {
    CollectionReference users = _firebaseFireStore.collection('users');
    QuerySnapshot querySnapshot = SharedPrefController().phone != null
        ? await users.where('phone', isEqualTo: SharedPrefController().phone)
        .get()
        : await users.where('email', isEqualTo: SharedPrefController().email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      String docId = querySnapshot.docs.first.id;
    }
    await _firebaseFireStore.collection('users').add(userRegisterationModel.toMap());
    SharedPrefController().saveUserIdRegistration(userIdRegistration: userRegisterationModel.usersRegisterationId);
  }

  Future<List<UsersRegisterationModel>> getUser() async {
    final messages = await _firebaseFireStore.collection('users').get();
    List<UsersRegisterationModel> list = messages.docs
        .map((e) => UsersRegisterationModel.fromJson(e.data()))
        .toList();
    return list;
  }

  Future<void> findEmailUserAndUpdate(String email, String password) async {
    CollectionReference users = _firebaseFireStore.collection('users');
    QuerySnapshot querySnapshot = await users.where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      String docId = querySnapshot.docs.first.id;
      await users.doc(docId).update({'password': password});
      print("User updated with ID: $docId");
    } else {
      print("No user found with email: $email");
    }
  }

  Future<void> findPhoneUserAndUpdate(String phone, String password) async {
    CollectionReference users = _firebaseFireStore.collection('users');
    QuerySnapshot querySnapshot = await users.where('phone', isEqualTo: phone)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      String docId = querySnapshot.docs.first.id;
      // SharedPrefController().saveUserIdRegistration(userIdRegistration: docId);
      await users.doc(docId).update({'password': password});
      print("User updated with ID: $docId");
    } else {
      print("No user found with email: $phone");
    }
  }

  /// UserProfileDataModel

  Future<bool> createUserData({required UserProfileDataModel userProfileDataModel}) {
    print(userProfileDataModel.userDataId);
    print('userProfileDataModel.userDataId');
    SharedPrefController().saveUserDataId(userDataId: userProfileDataModel.userDataId);
    print('create');
    return _firebaseFireStore
        .collection('userData')
        .add(userProfileDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  // Future<bool> updateUserData({required UserProfileDataModel userProfileDataModel}) {
  //   print('update');
  //   print(userProfileDataModel.id);
  //   return _firebaseFireStore
  //       .collection('userData')
  //       .doc(userProfileDataModel.id)
  //       .update(userProfileDataModel.toMap())
  //       .then((value) => true)
  //       .catchError((error) => false);
  // }

  Future<bool> updateUserData({required UserProfileDataModel userProfileDataModel}) async {
    try {
      print('0101');
      final postsCollection = _firebaseFireStore.collection('userData');
      print('1010');
      print(userProfileDataModel.userDataId);
      print('userProfileDataModel.userDataId');
      QuerySnapshot querySnapshot = await postsCollection.where('userDataId', isEqualTo: userProfileDataModel.userDataId).get();
      print('2010');
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        print('1020');
        await postsCollection.doc(doc.id).update(userProfileDataModel.toMap());
        print('Post ${doc.id} updated successfully.');
      }
      print('All posts updated successfully.');
      return true;
    } catch (e) {
      print('Error updating posts: $e');
      return false;
    }
  }

  Future<List<UserProfileDataModel>> getAllUserData() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore.collection(
          'userData').get();
      List<UserProfileDataModel> userList = querySnapshot.docs.map((doc) {
        return UserProfileDataModel.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
      return userList;
    } catch (e) {
      print('Error getting user data: $e');
      return [];
    }
  }

  Stream<List<UserProfileDataModel>> readUserData() {
    return _firebaseFireStore.collection('userData').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserProfileDataModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Stream<QuerySnapshot> readUserDataStream() async* {
    yield* _firebaseFireStore
        .collection('userData')
        .snapshots();
  }


  ///CRUD
  Future<bool> createInitiativePage({required InitiativeDataModel initiativeDataModel}) {
    SharedPrefController().saveInitiativeId(initiativeId: initiativeDataModel.initiativeId);
    return _firebaseFireStore
        .collection('initiative')
        .add(initiativeDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteInitiativePage({required String path}) {
    return _firebaseFireStore
        .collection('initiative')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateInitiativePage({required InitiativeDataModel initiativeDataModel}) async {
    try {
      final postsCollection = _firebaseFireStore.collection('initiative');
      QuerySnapshot querySnapshot = await postsCollection.where('iD', isEqualTo: initiativeDataModel.initiativeId).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await postsCollection.doc(doc.id).update(initiativeDataModel.toMap());
        print('Post ${doc.id} updated successfully.');
      }
      print('All posts updated successfully.');
      return true;
    } catch (e) {
      print('Error updating posts: $e');
      return false;
    }
  }

  Stream<QuerySnapshot> readInitiativePage() async* {
    yield* _firebaseFireStore
        .collection('initiative')
        .snapshots(); // عشان اي تحديث يصير على هذا الجدول يكون عنده علم فيه
  }

  Future<List<InitiativeDataModel>> getAllInitiative() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore.collection(
          'initiative').get();
      List<InitiativeDataModel> initiativeList = querySnapshot.docs.map((doc) {
        return InitiativeDataModel.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
      return initiativeList;
    } catch (e) {
      print('Error getting user data: $e');
      return [];
    }
  }

  Future<bool> createConversation({required ConversationModel conversationModel}) {
    // SharedPrefController().saveInitiativeId(initiativeId: conversationModel.conversationId);
    return _firebaseFireStore
        .collection('conversations')
        .add(conversationModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> readConversation() async* {
    yield* _firebaseFireStore
        .collection('conversations')
        .snapshots();
  }

  Future<List<ConversationModel>> getAllConversationData() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore.collection(
          'conversations').get();
      List<ConversationModel> conversationsList = querySnapshot.docs.map((doc) {
        return ConversationModel.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
      return conversationsList;
    } catch (e) {
      print('Error getting user data: $e');
      return [];
    }
  }

  Future<bool> createMessage({required MessageModel messageModel}) {
    // SharedPrefController().saveInitiativeId(initiativeId: conversationModel.conversationId);
    return _firebaseFireStore
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> readMessage() async* {
    yield* _firebaseFireStore
        .collection('messages')
        .orderBy('timeStamp', descending: true)
        .snapshots();
  }

  Future<bool> deleteMessage({required String path}) {
    return _firebaseFireStore
        .collection('messages')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<List<MessageModel>> getAllMessageData() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore.collection(
          'messages').get();
      List<MessageModel> conversationsList = querySnapshot.docs.map((doc) {
        return MessageModel.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
      return conversationsList;
    } catch (e) {
      print('Error getting user data: $e');
      return [];
    }
  }

  Future<int> countUnreadMessages() async {
    QuerySnapshot querySnapshot = await _firebaseFireStore
        .collection('messages')
        .where('isRead', isEqualTo: false)
        .get();

    return querySnapshot.docs.length;
  }

  ///CRUD
  Future<bool> createMartyrRequest(
      {required MartyrRequestDataModel martyrRequestDataModel}) {
    SharedPrefController().saveMartyrRequestDataId(martyrRequestDataId: martyrRequestDataModel.martyrRequestId);
    return _firebaseFireStore
        .collection('martyrRequestData')
        .add(martyrRequestDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteMartyrRequest({required String path}) {
    return _firebaseFireStore
        .collection('martyrRequestData')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateMartyrRequest(
      {required MartyrRequestDataModel martyrRequestDataModel}) async {
    try {
      final postsCollection = _firebaseFireStore.collection('martyrRequestData');
      QuerySnapshot querySnapshot = await postsCollection.where('martyrRequestId', isEqualTo: martyrRequestDataModel.martyrRequestId).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await postsCollection.doc(doc.id).update(martyrRequestDataModel.toMap());
        print('Post ${doc.id} updated successfully.');
      }
      print('All posts updated successfully.');
      return true;
    } catch (e) {
      print('Error updating posts: $e');
      return false;
    }
  }

  Stream<QuerySnapshot> readMartyrRequest() async* {
    yield* _firebaseFireStore
        .collection('martyrRequestData')
        .where('status', isEqualTo: 'pending')
        .snapshots(); // عشان اي تحديث يصير على هذا الجدول يكون عنده علم فيه
  }

  ///CRUD
  Future<bool> createMartyrData(
      {required MartyrProfileDataModel martyrProfileDataModel}) {
    print('create');
    return _firebaseFireStore
        .collection('martyrDta')
        .add(martyrProfileDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteMartyrData({required String path}) {
    return _firebaseFireStore
        .collection('martyrDta')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateMartyrData(
      {required MartyrProfileDataModel martyrProfileDataModel}) async {
    try {
      final postsCollection = _firebaseFireStore.collection('martyrDta');
      QuerySnapshot querySnapshot = await postsCollection.where('martyrDataId', isEqualTo: martyrProfileDataModel.martyrDataId).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await postsCollection.doc(doc.id).update(martyrProfileDataModel.toMap());
        print('Post ${doc.id} updated successfully.');
      }
      print('All posts updated successfully.');
      return true;
    } catch (e) {
      print('Error updating posts: $e');
      return false;
    }
  }

  Future<List<MartyrProfileDataModel>> getAllMartyrData() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore.collection(
          'martyrDta').get();
      List<MartyrProfileDataModel> userList = querySnapshot.docs.map((doc) {
        return MartyrProfileDataModel.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
      return userList;
    } catch (e) {
      print('Error getting user data: $e');
      return [];
    }
  }

  Stream<QuerySnapshot> readMartyrData() async* {
    yield* _firebaseFireStore
        .collection('martyrDta')
        .snapshots(); // عشان اي تحديث يصير على هذا الجدول يكون عنده علم فيه
  }

  Stream<QuerySnapshot> readMartyrStories() async* {
    yield* _firebaseFireStore
        .collection('martyrDta')
    .where('writeStory', isNotEqualTo: '')
        .snapshots(); // عشان اي تحديث يصير على هذا الجدول يكون عنده علم فيه
  }

  ///CRUD
  Future<bool> createMartyrStory(
      {required MartyrStoriesDataModel martyrStoriesDataModel}) {
    print('create');
    return _firebaseFireStore
        .collection('martyrStories')
        .add(martyrStoriesDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteMartyrStory({required String path}) {
    return _firebaseFireStore
        .collection('martyrStories')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateMartyrStory(
      {required MartyrStoriesDataModel martyrStoriesDataModel}) async {
    try {
      final postsCollection = _firebaseFireStore.collection('martyrStories');
      QuerySnapshot querySnapshot = await postsCollection.where('martyrDataId', isEqualTo: martyrStoriesDataModel.martyrDataId).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await postsCollection.doc(doc.id).update(martyrStoriesDataModel.toMap());
        print('Post ${doc.id} updated successfully.');
      }
      print('All posts updated successfully.');
      return true;
    } catch (e) {
      print('Error updating posts: $e');
      return false;
    }
  }

  Future<List<MartyrStoriesDataModel>> getAllMartyrStories() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore.collection(
          'martyrStories').get();
      List<MartyrStoriesDataModel> martyrStoriesList = querySnapshot.docs.map((doc) {
        return MartyrStoriesDataModel.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
      return martyrStoriesList;
    } catch (e) {
      print('Error getting user data: $e');
      return [];
    }
  }

  Stream<QuerySnapshot> readMartyrStory() async* {
    yield* _firebaseFireStore
        .collection('martyrStories')
        .snapshots();
  }

  ///CRUD
  Future<bool> createGroup(
      {required GroupDataModel groupDataModel}) {
    SharedPrefController().saveGroupId(groupId: groupDataModel.groupId);
    return _firebaseFireStore
        .collection('group')
        .add(groupDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteGroup({required String path}) {
    return _firebaseFireStore
        .collection('group')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  // Future<bool> updateGroup(
  //     {required GroupDataModel groupDataModel}) {
  //   return _firebaseFireStore
  //       .collection('group')
  //       .doc(groupDataModel.iD)
  //       .update(groupDataModel.toMap())
  //       .then((value) => true)
  //       .catchError((error) => false);
  // }

  Future<bool> updateGroup(
      {required GroupDataModel groupDataModel}) async {
    try {
      final postsCollection = _firebaseFireStore.collection('group');
      QuerySnapshot querySnapshot = await postsCollection.where('groupId', isEqualTo: groupDataModel.groupId).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await postsCollection.doc(doc.id).update(groupDataModel.toMap());
        print('Post ${doc.id} updated successfully.');
      }
      print('All posts updated successfully.');
      return true;
    } catch (e) {
      print('Error updating posts: $e');
      return false;
    }
  }

  Stream<QuerySnapshot> readGroups() async* {
    yield* _firebaseFireStore
        .collection('group')
        .snapshots(); // عشان اي تحديث يصير على هذا الجدول يكون عنده علم فيه
  }

  ///CRUD
  Future<bool> createPost(
      {required PostsModel postsModel}) {
    return _firebaseFireStore
        .collection('posts')
        .add(postsModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deletePost({required String path}) {
    return _firebaseFireStore
        .collection('posts')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  // Future<bool> updatePost(
  //     {required PostsModel postsModel}) {
  //   return _firebaseFireStore
  //       .collection('posts')
  //       .doc(postsModel.postId)
  //       .update(postsModel.toMap())
  //       .then((value) => true)
  //       .catchError((error) => false);
  // }
  Future<bool> updatePost(
      {required PostsModel postsModel}) async {
    try {
      final postsCollection = _firebaseFireStore.collection('posts');
      QuerySnapshot querySnapshot = await postsCollection.where('postId', isEqualTo: postsModel.postId).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await postsCollection.doc(doc.id).update(postsModel.toMap());
        print('Post ${doc.id} updated successfully.');
      }
      print('All posts updated successfully.');
      return true;
    } catch (e) {
      print('Error updating posts: $e');
      return false;
    }
  }

  Future<List<PostsModel>> getAllPostsData() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore.collection(
          'posts').get();
      List<PostsModel> postsList = querySnapshot.docs.map((doc) {
        return PostsModel.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
      return postsList;
    } catch (e) {
      print('Error getting Posts data: $e');
      return [];
    }
  }

  // Stream<List<PostsModel>> readPostData() {
  //   return _firebaseFireStore.collection('posts').snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return PostsModel.fromJson(doc.data() as Map<String, dynamic>);
  //     }).toList();
  //   });
  // }

  Stream<QuerySnapshot> readPosts() async* {
    yield* _firebaseFireStore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots();

  }

  ///CRUD
  Future<bool> addLike(
      {required LikesModel likesModel}) {

    return _firebaseFireStore
        .collection('likes')
        .add(likesModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  // Future<bool> deleteLike({required String path}) {
  //   return _firebaseFireStore
  //       .collection('likes')
  //       .doc(path)
  //       .delete()
  //       .then((value) => true)
  //       .catchError((error) => false);
  // }

  Future<bool> deleteLike({required String postId, required String userId}) async {
    try {
      print('01');
      // Query the document(s) that match the specific field value
      QuerySnapshot querySnapshot = await _firebaseFireStore
          .collection('likes')
          .where('postId', isEqualTo: postId )
          .where('userId', isEqualTo: userId )
          .get();
      print('02');
      // Check if any documents match the query
      if (querySnapshot.docs.isEmpty) {
        print('03');
        return false; // No matching documents found
      }
      print('04');
      // Iterate through the matching documents and delete them
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        print('05');
        await _firebaseFireStore.collection('likes').doc(doc.id).delete();
      }
      print('06');
      return true; // Deletion successful
    } catch (error) {
      print('Error deleting document: $error');
      return false; // Deletion failed
    }
  }

  Stream<QuerySnapshot> readLikes() async* {
    yield* _firebaseFireStore
        .collection('likes').snapshots();
  }

  ///CRUD
  Future<bool> createComment(
      {required CommentsModel commentsModel}) {
    return _firebaseFireStore
        .collection('comments')
        .add(commentsModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteComment({required String path}) {
    return _firebaseFireStore
        .collection('comments')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  // Future<List<CommentsModel>> fetchComments(String postId) async {
  //   QuerySnapshot querySnapshot = await _firebaseFireStore
  //       .collection('comments')
  //       .where('postId', isEqualTo: postId)
  //       .orderBy('timestamp', descending: true)
  //       .get();
  //
  //   return querySnapshot.docs.map((doc) {
  //     return CommentsModel.fromJson( doc.data() as Map<String, dynamic>);
  //   }).toList();
  // }

  // Future<List<CommentsModel>> fetchComments(String postId) async {
  //   try {
  //     QuerySnapshot querySnapshot = await _firebaseFireStore
  //         .collection('comments')
  //         .where('postId', isEqualTo: postId)
  //         .orderBy('timestamp', descending: true)
  //         .get();
  //     List<CommentsModel> commentList = querySnapshot.docs.map((doc) {
  //       return CommentsModel.fromJson(
  //           doc.data() as Map<String, dynamic>);
  //     }).toList();
  //     return commentList;
  //   } catch (e) {
  //     print('Error getting Posts data: $e');
  //     return [];
  //   }
  // }

  Stream<QuerySnapshot> readComment(String postId) async* {
    yield* _firebaseFireStore
        .collection('comments').where('postId', isEqualTo: postId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // Future<List<CommentsModel>> getAllComments() async {
  //   try {
  //     QuerySnapshot querySnapshot = await _firebaseFireStore.collection(
  //         'comments').get();
  //     List<CommentsModel> commentList = querySnapshot.docs.map((doc) {
  //       return CommentsModel.fromJson(
  //           doc.data() as Map<String, dynamic>);
  //     }).toList();
  //     return commentList;
  //   } catch (e) {
  //     print('Error getting Posts data: $e');
  //     return [];
  //   }
  // }

  // Future<bool> updateComment(
  //     {required CommentsModel commentsModel}) {
  //   return _firebaseFireStore
  //       .collection('comments')
  //       .doc(commentsModel.commentId)
  //       .update(commentsModel.toMap())
  //       .then((value) => true)
  //       .catchError((error) => false);
  // }

  Future<bool> updateComment(
      {required CommentsModel commentsModel}) async {
    try {
      final postsCollection = _firebaseFireStore.collection('comments');
      QuerySnapshot querySnapshot = await postsCollection.where('commentId', isEqualTo: commentsModel.commentId).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await postsCollection.doc(doc.id).update(commentsModel.toMap());
        print('Post ${doc.id} updated successfully.');
      }
      print('All posts updated successfully.');
      return true;
    } catch (e) {
      print('Error updating posts: $e');
      return false;
    }
  }

  // Stream<QuerySnapshot> readComment() async* {
  //   yield* _firebaseFireStore
  //       .collection('comments').snapshots();
  // }

  ///CRUD
  Future<bool> doRepost(
      {required RepostModel repostModel}) {
    return _firebaseFireStore
        .collection('reposts')
        .add(repostModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> undoRepost({required String path}) {
    return _firebaseFireStore
        .collection('reposts')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> readRepost() async* {
    yield* _firebaseFireStore
        .collection('reposts').snapshots();
  }

  ///CRUD
  Future<bool> addSaved(
      {required SavedModel savedModel}) {

    return _firebaseFireStore
        .collection('saved')
        .add(savedModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  // Future<bool> deleteLike({required String path}) {
  //   return _firebaseFireStore
  //       .collection('likes')
  //       .doc(path)
  //       .delete()
  //       .then((value) => true)
  //       .catchError((error) => false);
  // }

  Future<bool> deleteSaved({required String postId, required String userId}) async {
    try {
      print('01');
      print(postId);
      print('postId');
      print(userId);
      print('userId');
      // Query the document(s) that match the specific field value
      QuerySnapshot querySnapshot = await _firebaseFireStore
          .collection('saved')
          .where('postId', isEqualTo: postId )
          .where('userId', isEqualTo: userId )
          .get();
      print('02');
      // Check if any documents match the query
      if (querySnapshot.docs.isEmpty) {
        print('03');
        return false; // No matching documents found
      }
      print('04');
      // Iterate through the matching documents and delete them
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        print('05');
        await _firebaseFireStore.collection('saved').doc(doc.id).delete();
      }
      print('06');
      return true; // Deletion successful
    } catch (error) {
      print('Error deleting document: $error');
      return false; // Deletion failed
    }
  }

  Stream<QuerySnapshot> readSaved() async* {
    yield* _firebaseFireStore
        .collection('saved').snapshots();
  }


  ///CRUD
  Future<bool> createUserStory(
      {required StoryDataModel storyDataModel}) {
    return _firebaseFireStore
        .collection('stories')
        .add(storyDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteUserStory({required String path}) {
    return _firebaseFireStore
        .collection('stories')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<List<StoryDataModel>> getAllUserStory() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore.collection(
          'stories').get();
      List<StoryDataModel> storyDataModel = querySnapshot.docs.map((doc) {
        return StoryDataModel.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
      return storyDataModel;
    } catch (e) {
      print('Error getting Posts data: $e');
      return [];
    }
  }

  Stream<QuerySnapshot> readUserStory() async* {
    yield* _firebaseFireStore
        .collection('stories')
        .orderBy('timestamp', descending: true)
        .snapshots();

  }

  ///CRUD
  Future<bool> doFollow(
      {required FollowModel followModel}) {

    return _firebaseFireStore
        .collection('follow')
        .add(followModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> unFollow({required String followingId, required String userId}) async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore
          .collection('follow')
          .where('followingId', isEqualTo: followingId )
          .where('userId', isEqualTo: userId )
          .get();
      if (querySnapshot.docs.isEmpty) {
        print('03');
        return false; // No matching documents found
      }
      print('04');
      // Iterate through the matching documents and delete them
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        print('05');
        await _firebaseFireStore.collection('follow').doc(doc.id).delete();
      }
      print('06');
      return true; // Deletion successful
    } catch (error) {
      print('Error deleting document: $error');
      return false; // Deletion failed
    }
  }

  Stream<QuerySnapshot> readFollower() async* {
    yield* _firebaseFireStore
        .collection('follow').snapshots();
  }

  ///CRUD
  Future<bool> createArticle({required ArticleDataModel articleDataModel}) {
    return _firebaseFireStore
        .collection('articles')
        .add(articleDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteArticle({required String path}) {
    return _firebaseFireStore
        .collection('articles')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateArticle({required ArticleDataModel articleDataModel}) async {
    try {
      final postsCollection = _firebaseFireStore.collection('articles');
      QuerySnapshot querySnapshot = await postsCollection.where('articleId', isEqualTo: articleDataModel.articleId).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await postsCollection.doc(doc.id).update(articleDataModel.toMap());
        print('Post ${doc.id} updated successfully.');
      }
      print('All posts updated successfully.');
      return true;
    } catch (e) {
      print('Error updating posts: $e');
      return false;
    }
  }

  Stream<QuerySnapshot> readArticles() async* {
    yield* _firebaseFireStore
        .collection('articles')
        .orderBy('timeStamp', descending: true)
        .snapshots();
  }

}
