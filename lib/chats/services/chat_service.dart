import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection name for chat messages
  static const String chatsCollection = 'chats';

  // Subcollection name for messages within a chat
  static const String messagesSubcollection = 'messages';

  Future<void> sendMessage(String chatId, String senderId, String message, String receiverId) async {
    final messageRef = _firestore
        .collection(chatsCollection)
        .doc(chatId)
        .collection(messagesSubcollection)
        .doc();

    await messageRef.set({
      'senderId': senderId,
      'message': message,
      'receiverId': receiverId ,
      'timestamp': DateTime.now(),
    });
  }

  Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection(chatsCollection)
        .doc(chatId)
        .collection(messagesSubcollection)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  String getChatRoomId(String senderId, String receiverId){
    List<String> ids=[senderId, receiverId];
    ids.sort();
    return ids.join("_");

  }
}