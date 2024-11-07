import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> getUserName(String userId) async {
    print("abak $userId");
    try {
      DocumentSnapshot userDoc = await _firestore.collection('registeredUser').doc(userId).get();
      print("neha ${userDoc['name']}");
      if (userDoc.exists) {
        return userDoc['name'] as String?;
      }
    } catch (e) {
      print("Error fetching user name: $e");
    }
    return null;
  }
}
