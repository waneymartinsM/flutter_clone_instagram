import 'package:clone_instagram/app/core/firebase_const.dart';
import 'package:clone_instagram/app/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore dataBase = FirebaseFirestore.instance;

  Future recoverUserData() async {
    User user = _auth.currentUser!;
    UserModel userModel = UserModel();
    DocumentSnapshot snapshot =
        await dataBase.collection(FirebaseConst.users).doc(user.uid).get();
    userModel = UserModel.fromMap(snapshot.data() as Map);
    return userModel;
  }

  bool checkCurrentUser() {
    User? user = _auth.currentUser;
    return user != null ? true : false;
  }
}
